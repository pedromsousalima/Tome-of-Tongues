-- Tome of Tongues - Hooks.lua
-- Finds the quest / gossip text on screen, swaps words, and queues the quiz.

local ADDON_NAME, ns = ...

local lastOutput = setmetatable({}, { __mode = "k" }) -- fontstring -> text we wrote

local function processFontStrings(list)
  if not ns.db or not ns.db.settings.enabled then return end
  local ctx = ns.NewContext()
  local changed = false
  for _, fs in ipairs(list) do
    if fs and fs.GetText then
      local text = fs:GetText()
      if text and text ~= "" and lastOutput[fs] ~= text then
        local out = ns.Transform(text, ctx)
        if out ~= text then
          fs:SetText(out)
          lastOutput[fs] = out
          changed = true
        end
      end
    end
  end
  if changed then ns.UI.Enqueue(ns.PickQuizWords(ctx)) end
end

local function G(name) return _G[name] end

-- Quest dialogue panels -----------------------------------------------------
local QUEST_TARGETS = {
  QUEST_DETAIL   = { "QuestInfoDescriptionText", "QuestInfoObjectivesText" },
  QUEST_PROGRESS = { "QuestProgressText" },
  QUEST_COMPLETE = { "QuestInfoRewardText" },
  QUEST_GREETING = { "QuestGreetingText", "GreetingText" },
}

local function processQuest(event)
  local list = {}
  for _, name in ipairs(QUEST_TARGETS[event]) do
    local fs = G(name)
    if fs and fs.IsVisible and fs:IsVisible() then list[#list + 1] = fs end
  end
  processFontStrings(list)
end

-- Gossip (talking to NPCs) --------------------------------------------------
local function findFontString(frame, text, depth)
  if not frame or depth > 10 then return end
  for _, r in ipairs({ frame:GetRegions() }) do
    if r.GetObjectType and r:GetObjectType() == "FontString" and r:GetText() == text then return r end
  end
  for _, child in ipairs({ frame:GetChildren() }) do
    local hit = findFontString(child, text, depth + 1)
    if hit then return hit end
  end
end

local function gossipText()
  if C_GossipInfo and C_GossipInfo.GetText then return C_GossipInfo.GetText() end
  if GetGossipText then return GetGossipText() end
end

local function processGossip()
  local text = gossipText()
  local fs
  if text and text ~= "" then
    fs = (GossipGreetingText and GossipGreetingText:GetText() == text and GossipGreetingText)
      or findFontString(GossipFrame, text, 0)
  end
  if fs then processFontStrings({ fs }) end
end

-- Events --------------------------------------------------------------------
local TITLE = "|cffa335eeTome|r |cffffd100of|r |cffa335eeTongues|r"

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
for event in pairs(QUEST_TARGETS) do f:RegisterEvent(event) end
f:RegisterEvent("GOSSIP_SHOW")

f:SetScript("OnEvent", function(self, event, arg1)
  if event == "ADDON_LOADED" then
    if arg1 ~= ADDON_NAME then return end
    ns.InitDB()
    ns.BuildAll()
    if not ns.LANGS[ns.db.settings.lang] then ns.db.settings.lang = "sv" end
    print(TITLE .. " loaded - studying |cffffd100" .. ns.Lang().name .. "|r. Type |cffffd100/tot|r for your standing, |cffffd100/tot help|r for options.")
    return
  end
  if not ns.db then return end
  -- wait a moment so Blizzard's own code has filled in the text first
  if event == "GOSSIP_SHOW" then
    ns.After(0.05, processGossip)
  else
    ns.After(0.05, function() processQuest(event) end)
  end
end)

-- Slash commands ------------------------------------------------------------
local function say(msg) print("|cffa335eeTome of Tongues:|r " .. msg) end

local function listLanguages()
  say("languages (|cffffd100/tot lang <name or code>|r):")
  for _, code in ipairs(ns.LANG_ORDER) do
    local l, p = ns.LANGS[code], ns.db.langs[code]
    local lvl = (type(p) == "table" and p.level) and string.format("level %.0f", p.level) or "not started"
    local mark = (code == ns.Lang().code) and " |cff33ff33<- current|r" or ""
    print(string.format("  |cffffd100%s|r  %s (%s) - %s%s", code, l.name, l.native, lvl, mark))
  end
end

SLASH_TOMEOFTONGUES1 = "/tot"
SLASH_TOMEOFTONGUES2 = "/tome"
SlashCmdList.TOMEOFTONGUES = function(msg)
  local cmd, rest = (msg or ""):match("^%s*(%S*)%s*(.-)%s*$")
  cmd = cmd:lower()
  local s = ns.db.settings
  if cmd == "" or cmd == "stats" or cmd == "standing" then
    ns.UI.ToggleStanding()
  elseif cmd == "lang" or cmd == "language" then
    if rest == "" then listLanguages(); return end
    local code = ns.FindLanguage(rest)
    if code then
      ns.UI.SetLanguage(code)
      say("now studying |cffffd100" .. ns.LANGS[code].name .. "|r (" .. ns.LANGS[code].native .. ").")
      if ns.LANGS[code].note then say(ns.LANGS[code].note) end
    else
      say("unknown language '" .. rest .. "'."); listLanguages()
    end
  elseif cmd == "langs" or cmd == "languages" then
    listLanguages()
  elseif cmd == "pause" or cmd == "off" then
    s.enabled = false; say("paused. |cffffd100/tot on|r to resume.")
  elseif cmd == "on" or cmd == "resume" then
    s.enabled = true; say("on - good luck!")
  elseif cmd == "quiz" then
    local n = tonumber(rest)
    if n then s.maxQuiz = math.max(0, math.min(10, math.floor(n))); s.quiz = s.maxQuiz > 0
    else s.quiz = not s.quiz end
    say("quiz pop-ups " .. (s.quiz and ("on (max " .. s.maxQuiz .. " per dialogue)") or "off"))
  elseif cmd == "color" or cmd == "colour" then
    s.color = not s.color; say("highlighting foreign words " .. (s.color and "on" or "off"))
  elseif cmd == "plain" then
    s.plain = not s.plain; say("accent stripping " .. (s.plain and "on (é -> e)" or "off"))
  elseif cmd == "focus" then
    s.autofocus = not s.autofocus; say("auto-focus the answer box " .. (s.autofocus and "on" or "off"))
  elseif cmd == "level" and tonumber(rest) then
    local P = ns.Profile()
    P.level = math.max(0, math.min(100, tonumber(rest))); P.skill = P.level
    say(ns.Lang().name .. " level set to " .. P.level)
    ns.UI.RefreshStanding()
  elseif cmd == "test" then
    local ctx = ns.NewContext()
    local out = ns.Transform(rest ~= "" and rest or "Hello friend, I need your help. The wolves in the forest are dangerous and the children are afraid to go outside.", ctx)
    say(out)
    ns.UI.Enqueue(ns.PickQuizWords(ctx))
  elseif cmd == "reset" then
    if rest:lower() == "confirm" then
      ns.ResetProfile(); say(ns.Lang().name .. " progress reset."); ns.UI.RefreshStanding()
    elseif rest:lower() == "all confirm" then
      ns.InitDB(true); say("all progress reset."); ns.UI.RefreshStanding()
    else
      say("|cffffd100/tot reset confirm|r wipes your " .. ns.Lang().name .. " progress, |cffffd100/tot reset all confirm|r wipes every language.")
    end
  else
    say("commands:")
    print("  /tot  - show your standing (use the arrows to switch language)")
    print("  /tot lang <name>  - study another language;  /tot langs  - list them")
    print("  /tot pause | on  - stop / resume swapping words")
    print("  /tot quiz  - toggle pop-ups;  /tot quiz 2  - max pop-ups per dialogue")
    print("  /tot color  - toggle highlighting of foreign words")
    print("  /tot plain  - strip accents if letters show as boxes")
    print("  /tot focus  - toggle auto-focusing the answer box")
    print("  /tot test <text>  - swap a sentence and open the quiz pop-up")
    print("  /tot level <0-100>  - set your level by hand")
    print("  /tot reset  - start a language over")
  end
end
