-- Tome of Tongues - UI.lua
-- The quiz pop-up and the standing window (with language picker).

local ADDON_NAME, ns = ...
local UI = {}
ns.UI = UI

local BACKDROP_TEMPLATE = BackdropTemplateMixin and "BackdropTemplate" or nil
local BACKDROP = {
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  tile = true, tileSize = 32, edgeSize = 24,
  insets = { left = 8, right = 8, top = 8, bottom = 8 },
}
local ARCANE, GOLD = { 0.64, 0.21, 0.93 }, { 1.0, 0.8, 0.0 }
local FLAG_H = 14 -- height of the flag banner along the top of each window

local function after(sec, fn)
  if C_Timer and C_Timer.After then C_Timer.After(sec, fn) return end
  local f, t = CreateFrame("Frame"), 0
  f:SetScript("OnUpdate", function(self, e)
    t = t + e
    if t >= sec then self:SetScript("OnUpdate", nil); fn() end
  end)
end
ns.After = after

local function makeWindow(name, w, h)
  local f = CreateFrame("Frame", name, UIParent, BACKDROP_TEMPLATE)
  f:SetSize(w, h)
  if f.SetBackdrop then f:SetBackdrop(BACKDROP) end
  f:SetFrameStrata("DIALOG")
  f:SetClampedToScreen(true)
  f:EnableMouse(true)
  f:SetMovable(true)
  f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart", f.StartMoving)
  f:SetScript("OnDragStop", f.StopMovingOrSizing)

  f.flagW, f.flagH = w - 20, FLAG_H
  f.flags = {}

  local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", -2, -2 - FLAG_H)
  f.closeButton = close

  f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  f.title:SetPoint("TOP", 0, -30)
  f:Hide()
  return f
end

---------------------------------------------------------------------------
-- Flags: drawn from plain colored rectangles, circles and a diamond,
-- stretched as a banner across the top of the window.
---------------------------------------------------------------------------
local C = {
  white = { 1, 1, 1 },
  se_blue = { 0, 0.42, 0.66 },  se_yellow = { 1, 0.8, 0 },
  no_red = { 0.73, 0.05, 0.18 }, no_blue = { 0, 0.13, 0.41 },
  de_black = { 0.05, 0.05, 0.05 }, de_red = { 0.87, 0, 0 }, de_gold = { 1, 0.81, 0 },
  fr_blue = { 0, 0.14, 0.58 },  fr_red = { 0.93, 0.16, 0.22 },
  es_red = { 0.67, 0.08, 0.11 }, es_yellow = { 0.95, 0.75, 0 },
  it_green = { 0, 0.57, 0.27 }, it_red = { 0.81, 0.17, 0.22 },
  nl_red = { 0.68, 0.11, 0.16 }, nl_blue = { 0.13, 0.27, 0.55 },
  pt_green = { 0, 0.4, 0 }, pt_red = { 1, 0, 0 }, pt_yellow = { 1, 0.9, 0 },
  br_green = { 0, 0.61, 0.23 }, br_yellow = { 1, 0.87, 0 }, br_blue = { 0, 0.15, 0.46 },
  jp_red = { 0.74, 0, 0.18 },
}

-- Painter: d is a drawing context with x/w offsets so a flag can fill
-- any horizontal slice of the banner (used for Portugal | Brazil).
local function rect(d, x0, y0, x1, y1, col, layer)
  local t = d.holder:CreateTexture(nil, "ARTWORK", nil, layer or 0)
  t:SetColorTexture(col[1], col[2], col[3], 1)
  t:SetPoint("TOPLEFT", d.holder, "TOPLEFT", d.x + x0 * d.w, -y0 * d.h)
  t:SetSize(math.max(1, (x1 - x0) * d.w), math.max(1, (y1 - y0) * d.h))
  return t
end

-- rectangle in pixels, centered on a fraction of the slice
local function prect(d, cx, cy, pw, ph, col, layer)
  local t = d.holder:CreateTexture(nil, "ARTWORK", nil, layer or 0)
  t:SetColorTexture(col[1], col[2], col[3], 1)
  t:SetSize(pw, ph)
  t:SetPoint("CENTER", d.holder, "TOPLEFT", d.x + cx * d.w, -cy * d.h)
  return t
end

local function circle(d, cx, cy, radius, col, layer)
  local t = prect(d, cx, cy, radius * 2, radius * 2, col, layer)
  if d.holder.CreateMaskTexture and t.AddMaskTexture then
    local m = d.holder:CreateMaskTexture()
    m:SetTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    m:SetAllPoints(t)
    t:AddMaskTexture(m)
  end
  return t
end

local function diamond(d, cx, cy, size, col, layer)
  local t = prect(d, cx, cy, size, size, col, layer)
  if t.SetRotation then t:SetRotation(math.rad(45)) end
  return t
end

local function hstripes(d, cols, weights)
  local total, y = 0, 0
  for _, wgt in ipairs(weights) do total = total + wgt end
  for k, col in ipairs(cols) do
    local y1 = y + weights[k] / total
    rect(d, 0, y, 1, y1, col); y = y1
  end
end

local function vstripes(d, cols)
  for k, col in ipairs(cols) do rect(d, (k - 1) / #cols, 0, k / #cols, 1, col) end
end

-- Nordic cross: bars sized in pixels so they look right on a wide banner
local function nordic(d, bg, cross, inner)
  rect(d, 0, 0, 1, 1, bg)
  local cx = 0.3
  prect(d, cx, 0.5, d.h * 0.5, d.h, cross, 1)
  prect(d, 0.5, 0.5, d.w, d.h * 0.34, cross, 1)
  if inner then
    prect(d, cx, 0.5, d.h * 0.25, d.h, inner, 2)
    prect(d, 0.5, 0.5, d.w, d.h * 0.16, inner, 2)
  end
end

local FLAG_PAINTERS = {
  sv = function(d) nordic(d, C.se_blue, C.se_yellow) end,
  no = function(d) nordic(d, C.no_red, C.white, C.no_blue) end,
  de = function(d) hstripes(d, { C.de_black, C.de_red, C.de_gold }, { 1, 1, 1 }) end,
  nl = function(d) hstripes(d, { C.nl_red, C.white, C.nl_blue }, { 1, 1, 1 }) end,
  es = function(d) hstripes(d, { C.es_red, C.es_yellow, C.es_red }, { 1, 2, 1 }) end,
  fr = function(d) vstripes(d, { C.fr_blue, C.white, C.fr_red }) end,
  it = function(d) vstripes(d, { C.it_green, C.white, C.it_red }) end,
  ja = function(d)
    rect(d, 0, 0, 1, 1, C.white)
    circle(d, 0.5, 0.5, d.h * 0.38, C.jp_red, 1)
  end,
  pt = function(d)
    -- left half Portugal, right half Brazil
    local half = d.w / 2
    local pt = { holder = d.holder, x = d.x, w = half, h = d.h }
    rect(pt, 0, 0, 0.4, 1, C.pt_green)
    rect(pt, 0.4, 0, 1, 1, C.pt_red)
    circle(pt, 0.4, 0.5, d.h * 0.36, C.pt_yellow, 1)
    local br = { holder = d.holder, x = d.x + half, w = half, h = d.h }
    rect(br, 0, 0, 1, 1, C.br_green)
    diamond(br, 0.5, 0.5, d.h * 0.66, C.br_yellow, 1)
    circle(br, 0.5, 0.5, d.h * 0.24, C.br_blue, 2)
  end,
}

-- Show the flag of language `code` across the top of window `f`.
local function showFlag(f, code)
  for _, h in pairs(f.flags) do h:Hide() end
  local holder = f.flags[code]
  if not holder then
    holder = CreateFrame("Frame", nil, f)
    holder:SetPoint("TOPLEFT", 10, -10)
    holder:SetSize(f.flagW, f.flagH)
    if holder.SetClipsChildren then holder:SetClipsChildren(true) end
    local painter = FLAG_PAINTERS[code]
    local d = { holder = holder, x = 0, w = f.flagW, h = f.flagH }
    if painter then
      painter(d)
    else -- languages without a flag yet: arcane + gold, like a tome's spine
      hstripes(d, { ARCANE, GOLD }, { 2, 1 })
    end
    f.flags[code] = holder
  end
  holder:Show()
end
UI.ShowFlag = showFlag

---------------------------------------------------------------------------
-- Quiz pop-up
---------------------------------------------------------------------------
local queue = {}
local current
local quiz

local function buildQuiz()
  quiz = makeWindow("TomeOfTonguesQuiz", 320, 158)
  quiz:SetPoint("TOP", UIParent, "TOP", 0, -110)

  quiz.counter = quiz:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
  quiz.counter:SetPoint("TOPLEFT", 18, -32)

  quiz.prompt = quiz:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  quiz.prompt:SetPoint("TOP", 0, -56)
  quiz.prompt:SetWidth(290)

  local box = CreateFrame("EditBox", "TomeOfTonguesQuizInput", quiz, "InputBoxTemplate")
  box:SetSize(170, 24)
  box:SetPoint("TOPLEFT", 24, -80)
  box:SetAutoFocus(false)
  box:SetMaxLetters(60)
  box:SetScript("OnEnterPressed", function() UI.Submit() end)
  box:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  quiz.input = box

  local check = CreateFrame("Button", nil, quiz, "UIPanelButtonTemplate")
  check:SetSize(90, 24)
  check:SetPoint("LEFT", box, "RIGHT", 10, 0)
  check:SetText("Check")
  check:SetScript("OnClick", function() UI.Submit() end)
  quiz.check = check

  local skip = CreateFrame("Button", nil, quiz, "UIPanelButtonTemplate")
  skip:SetSize(110, 20)
  skip:SetPoint("BOTTOMRIGHT", -16, 14)
  skip:SetText("Don't know")
  skip:SetScript("OnClick", function() UI.Submit(true) end)
  quiz.skip = skip

  quiz.feedback = quiz:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  quiz.feedback:SetPoint("BOTTOMLEFT", 20, 18)
  quiz.feedback:SetPoint("RIGHT", skip, "LEFT", -6, 0)
  quiz.feedback:SetJustifyH("LEFT")

  -- closing the pop-up just drops the remaining questions, no penalty
  quiz.closeButton:SetScript("OnClick", function() wipe(queue); current = nil; quiz:Hide() end)
end

local function showNext()
  current = table.remove(queue, 1)
  if not current then quiz:Hide(); return end
  local lang = ns.LANGS[current.lang]
  quiz.locked = false
  showFlag(quiz, lang.code)
  quiz.title:SetText("A strange tome appears")
  quiz.counter:SetText(#queue > 0 and ("+" .. #queue .. " more") or "")
  quiz.prompt:SetText("What does |cffc080ff" .. ns.Display(current.fx) .. "|r mean in English?")
  quiz.feedback:SetText("")
  quiz.input:SetText("")
  quiz.input:Enable()
  quiz.check:Enable(); quiz.skip:Enable()
  quiz:Show()
  if ns.db.settings.autofocus then quiz.input:SetFocus() end
end

function UI.Enqueue(picks)
  if not quiz then buildQuiz() end
  for _, p in ipairs(picks) do
    local dup = (current and current.fx == p.fx and current.lang == p.lang)
    for _, q in ipairs(queue) do if q.fx == p.fx and q.lang == p.lang then dup = true end end
    if not dup then table.insert(queue, p) end
  end
  if not current and #queue > 0 then showNext() end
end

function UI.ClearQuiz()
  wipe(queue); current = nil
  if quiz then quiz:Hide() end
end

function UI.Submit(gaveUp)
  if not current or quiz.locked then return end
  quiz.locked = true
  local result, matched
  if gaveUp then
    result = "skip"
  else
    result, matched = ns.CheckAnswer(current.fx, quiz.input:GetText(), current.lang)
  end
  ns.RecordAnswer(current.fx, result, current.lang)

  local word = ns.Display(current.fx)
  if result == "correct" then
    quiz.feedback:SetText("|cff33ff33Correct!|r  " .. word .. " = " .. current.en)
  elseif result == "close" then
    quiz.feedback:SetText("|cff99ff33Close enough!|r  spelled: " .. matched)
  else
    quiz.feedback:SetText("|cffff4444Wrong.|r  " .. word .. " = " .. current.en)
  end
  quiz.input:ClearFocus()
  quiz.input:Disable()
  quiz.check:Disable(); quiz.skip:Disable()
  UI.RefreshStanding()

  local delay = (result == "correct") and 1.2 or 2.4
  after(delay, function() if quiz.locked then showNext() end end)
end

---------------------------------------------------------------------------
-- Standing window
---------------------------------------------------------------------------
local st
local GRAPH_W, GRAPH_H = 300, 60

local function line(parent, anchor, yOff)
  local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  fs:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, yOff or -6)
  fs:SetJustifyH("LEFT")
  fs:SetWidth(300)
  return fs
end

function UI.CycleLanguage(dir)
  local order = ns.LANG_ORDER
  local cur = ns.Lang().code
  local idx = 1
  for k, code in ipairs(order) do if code == cur then idx = k end end
  idx = (idx - 1 + dir) % #order + 1
  UI.SetLanguage(order[idx])
end

function UI.SetLanguage(code)
  ns.db.settings.lang = code
  UI.ClearQuiz()
  UI.RefreshStanding()
end

local function arrow(parent, dir)
  local b = CreateFrame("Button", nil, parent)
  b:SetSize(26, 26)
  local tex = dir < 0 and "Interface\\Buttons\\UI-SpellbookIcon-PrevPage" or "Interface\\Buttons\\UI-SpellbookIcon-NextPage"
  b:SetNormalTexture(tex .. "-Up")
  b:SetPushedTexture(tex .. "-Down")
  b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
  b:SetScript("OnClick", function() UI.CycleLanguage(dir) end)
  return b
end

local function buildStanding()
  st = makeWindow("TomeOfTonguesStanding", 340, 508)
  st:SetPoint("CENTER")
  st.title:SetText("Tome of Tongues")
  tinsert(UISpecialFrames, "TomeOfTonguesStanding") -- Esc closes it

  -- language picker
  st.langName = st:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
  st.langName:SetPoint("TOP", 0, -56)
  local prev = arrow(st, -1); prev:SetPoint("RIGHT", st.langName, "LEFT", -8, 0); st.prev = prev
  local nxt = arrow(st, 1); nxt:SetPoint("LEFT", st.langName, "RIGHT", 8, 0); st.next = nxt
  st.langNote = st:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
  st.langNote:SetPoint("TOP", st.langName, "BOTTOM", 0, -4)
  st.langNote:SetWidth(300)

  st.rank = st:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  st.rank:SetPoint("TOPLEFT", 20, -108)

  local bar = CreateFrame("StatusBar", nil, st)
  bar:SetPoint("TOPLEFT", st.rank, "BOTTOMLEFT", 0, -8)
  bar:SetSize(300, 16)
  bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
  bar:SetStatusBarColor(ARCANE[1], ARCANE[2], ARCANE[3])
  bar:SetMinMaxValues(0, 100)
  local bg = bar:CreateTexture(nil, "BACKGROUND")
  bg:SetAllPoints(); bg:SetColorTexture(0, 0, 0, 0.5)
  bar.text = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  bar.text:SetPoint("CENTER")
  st.bar = bar

  st.rate = line(st, bar, -10)
  st.unlocks = line(st, st.rate)
  st.acc = line(st, st.unlocks, -10)
  st.recent = line(st, st.acc)
  st.streak = line(st, st.recent)
  st.vocab = line(st, st.streak, -10)

  local gl = st:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  gl:SetPoint("TOPLEFT", st.vocab, "BOTTOMLEFT", 0, -12)
  gl:SetText("Level over your last answers")

  local graph = CreateFrame("Frame", nil, st)
  graph:SetPoint("TOPLEFT", gl, "BOTTOMLEFT", 0, -4)
  graph:SetSize(GRAPH_W, GRAPH_H)
  local gbg = graph:CreateTexture(nil, "BACKGROUND")
  gbg:SetAllPoints(); gbg:SetColorTexture(0, 0, 0, 0.4)
  graph.bars = {}
  local bw = GRAPH_W / ns.HISTORY_SIZE
  for k = 1, ns.HISTORY_SIZE do
    local t = graph:CreateTexture(nil, "ARTWORK")
    t:SetWidth(math.max(1, bw - 1))
    t:SetPoint("BOTTOMLEFT", (k - 1) * bw, 0)
    t:SetColorTexture(GOLD[1], GOLD[2], GOLD[3], 0.85)
    t:Hide()
    graph.bars[k] = t
  end
  st.graph = graph

  local hl = st:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  hl:SetPoint("TOPLEFT", graph, "BOTTOMLEFT", 0, -12)
  hl:SetText("Words to practise")
  st.hard = line(st, hl, -4)
  st.hard:SetSpacing(2)

  st:SetScript("OnShow", function() UI.RefreshStanding() end)
end

function UI.RefreshStanding()
  if not st or not st:IsShown() then return end
  local lang = ns.Lang()
  local P = ns.Profile(lang.code)
  local L = P.level

  showFlag(st, lang.code)
  st.langName:SetText(lang.name .. "  |cffaaaaaa(" .. lang.native .. ")|r")
  st.langNote:SetText(lang.note or "")

  st.rank:SetText(ns.Rank(L)[2])
  st.bar:SetValue(L)
  st.bar.text:SetText(string.format("Level %.1f / 100", L))

  st.rate:SetText(string.format("Swap rate: |cffffd100%d%%|r of known words", math.floor(ns.ReplaceRate(L) * 100 + 0.5)))
  local unlock = "Word tiers: |cffffd100" .. math.min(ns.MaxTier(L), 4) .. "/4|r"
  unlock = unlock .. (L >= ns.TIER_UNLOCK[5] and "  |cff33ff33phrases|r" or ("  phrases at " .. ns.TIER_UNLOCK[5]))
  unlock = unlock .. (L >= ns.SENTENCE_MODE_LEVEL and "  |cff33ff33full sentences|r" or ("  sentences at " .. ns.SENTENCE_MODE_LEVEL))
  st.unlocks:SetText(unlock)

  local pct = P.answered > 0 and (P.correct / P.answered * 100) or 0
  st.acc:SetText(string.format("Answered: %d   Correct: %d  (%.0f%%)", P.answered, P.correct, pct))
  st.recent:SetText(string.format("Recent form: %.0f%%", P.recent * 100))
  st.streak:SetText(string.format("Streak: %d   Best: %d", P.streak, P.bestStreak))

  local seen, mastered = 0, 0
  for fx, w in pairs(P.words) do
    if w.seen > 0 then seen = seen + 1 end
    if w.streak >= ns.MASTERY_STREAK then mastered = mastered + 1 end
  end
  st.vocab:SetText(string.format("Words met: %d   Mastered: |cff33ff33%d|r   In tome: %d", seen, mastered, lang.count))

  local h = P.history
  for k = 1, ns.HISTORY_SIZE do
    local t = st.graph.bars[k]
    local v = h[#h - ns.HISTORY_SIZE + k]
    if v then
      t:SetHeight(math.max(1, v / 100 * GRAPH_H))
      t:Show()
    else
      t:Hide()
    end
  end

  local hard = {}
  for fx, w in pairs(P.words) do
    if w.wrong > 0 and w.streak < ns.MASTERY_STREAK then hard[#hard + 1] = { fx = fx, w = w } end
  end
  table.sort(hard, function(a, b) return (a.w.wrong - a.w.right) > (b.w.wrong - b.w.right) end)
  local lines = {}
  for k = 1, math.min(6, #hard) do
    local e = hard[k]
    local means = ns.AnswersFor(e.fx, lang.code)[1] or "?"
    lines[#lines + 1] = string.format("|cffc080ff%s|r = %s   |cffaaaaaa(%d right, %d wrong)|r", ns.Display(e.fx), means, e.w.right, e.w.wrong)
  end
  st.hard:SetText(#lines > 0 and table.concat(lines, "\n") or "|cffaaaaaaNothing yet - keep questing!|r")
end

function UI.ToggleStanding()
  if not st then buildStanding() end
  if st:IsShown() then st:Hide() else st:Show() end
end
