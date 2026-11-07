-- Tome of Tongues - Core.lua
-- Languages, word swapping, answer checking and the progression model.

local ADDON_NAME, ns = ...

local floor, min, max, random = math.floor, math.min, math.max, math.random
local tinsert, tsort = table.insert, table.sort

---------------------------------------------------------------------------
-- Tunables
---------------------------------------------------------------------------
ns.TIER_UNLOCK = { [1] = 0, [2] = 15, [3] = 35, [4] = 55, [5] = 65 } -- level needed
ns.SENTENCE_MODE_LEVEL = 85   -- from here, whole sentences can flip
ns.MASTERY_STREAK = 3         -- correct in a row = word mastered
ns.HISTORY_SIZE = 60

ns.RANKS = {
  { 0,  "Apprentice" },
  { 15, "Journeyman" },
  { 35, "Expert" },
  { 55, "Artisan" },
  { 75, "Master" },
  { 90, "Grand Master" },
}

local PROFILE_DEFAULTS = {
  level = 0,          -- 0..100, the smoothed value everything is driven by
  skill = 0,          -- 0..100, raw value that moves with every answer
  answered = 0,
  correct = 0,
  recent = 0.5,       -- moving average of recent results (0..1)
  streak = 0,
  bestStreak = 0,
  words = {},         -- [foreign word] = { seen, right, wrong, streak }
  history = {},       -- level after each answer (for the graph)
}

local DEFAULTS = {
  langs = {},         -- [code] = profile
  settings = {
    lang = "sv",
    enabled = true,
    quiz = true,
    maxQuiz = 3,       -- max pop-ups per dialogue
    color = true,      -- tint foreign words in the dialogue
    colorHex = "ff0a5fb4",
    autofocus = true,
    plain = false,     -- strip accents (if the game font shows boxes)
  },
}

---------------------------------------------------------------------------
-- Language registry
---------------------------------------------------------------------------
ns.LANGS, ns.LANG_ORDER = {}, {}

-- data: either a list of rows { english, foreign, tier, "alts" } (full list)
-- or a string of "english = foreign" lines; tier and extra answers then come
-- from the shared concept list (built from the Swedish rows).
function ns.AddLanguage(code, name, native, data, note)
  ns.LANGS[code] = { code = code, name = name, native = native, data = data, note = note }
  tinsert(ns.LANG_ORDER, code)
end

local function normalize(s)
  s = (s or ""):lower()
  s = s:gsub("[^%a%s']", " ")
  s = s:gsub("%s+", " "):gsub("^ ", ""):gsub(" $", "")
  for _, prefix in ipairs({ "to ", "a ", "an ", "the " }) do
    if s:sub(1, #prefix) == prefix and #s > #prefix then s = s:sub(#prefix + 1) end
  end
  return s
end
ns.normalize = normalize

local function buildLanguage(lang)
  lang.words, lang.phrasesByFirst, lang.answers, lang.count = {}, {}, {}, 0
  local rows = {}
  if type(lang.data) == "table" then
    for _, r in ipairs(lang.data) do
      local alts = {}
      if r[4] then for a in r[4]:gmatch("[^;]+") do alts[#alts + 1] = a end end
      rows[#rows + 1] = { r[1]:lower(), r[2], r[3] or 1, alts }
    end
  else
    for item in lang.data:gmatch("[^;\n]+") do
      local en, fx = item:match("^%s*(.-)%s*=%s*(.-)%s*$")
      if en and en ~= "" and fx and fx ~= "" then
        en = en:lower()
        local c = ns.CONCEPT[en]
        rows[#rows + 1] = { en, fx, c and c.tier or 4, c and c.alts or {} }
      end
    end
  end

  for _, r in ipairs(rows) do
    local en, fx, tier, alts = r[1], r[2], r[3], r[4]
    if fx:lower() ~= en then -- same word in both languages teaches nothing
      local entry = { en = en, fx = fx, tier = tier }
      if en:find(" ") then
        local parts = {}
        for w in en:gmatch("%S+") do parts[#parts + 1] = w end
        entry.parts = parts
        local list = lang.phrasesByFirst[parts[1]] or {}
        lang.phrasesByFirst[parts[1]] = list
        tinsert(list, entry)
      else
        lang.words[en] = lang.words[en] or entry
      end
      if not lang.answers[fx] then lang.answers[fx] = {}; lang.count = lang.count + 1 end
      lang.answers[fx][normalize(en)] = true
      for _, a in ipairs(alts) do lang.answers[fx][normalize(a)] = true end
    end
  end
  for _, list in pairs(lang.phrasesByFirst) do
    tsort(list, function(a, b) return #a.parts > #b.parts end) -- longest first
  end
end

function ns.BuildAll()
  ns.CONCEPT = {}
  for _, r in ipairs(ns.LANGS.sv.data) do
    local en = r[1]:lower()
    local c = ns.CONCEPT[en]
    if not c then c = { tier = r[3] or 1, alts = {} }; ns.CONCEPT[en] = c end
    if r[4] then for a in r[4]:gmatch("[^;]+") do tinsert(c.alts, a) end end
  end
  for _, lang in pairs(ns.LANGS) do buildLanguage(lang) end
  tsort(ns.LANG_ORDER, function(a, b) return ns.LANGS[a].name < ns.LANGS[b].name end)
end

function ns.FindLanguage(q)
  q = (q or ""):lower()
  if ns.LANGS[q] then return q end
  for code, l in pairs(ns.LANGS) do
    if l.name:lower() == q or l.native:lower() == q then return code end
  end
  for code, l in pairs(ns.LANGS) do
    if l.name:lower():sub(1, #q) == q then return code end
  end
end

---------------------------------------------------------------------------
-- Saved data
---------------------------------------------------------------------------
local function fillDefaults(dst, src)
  for k, v in pairs(src) do
    if type(v) == "table" then
      if type(dst[k]) ~= "table" then dst[k] = {} end
      fillDefaults(dst[k], v)
    elseif dst[k] == nil then
      dst[k] = v
    end
  end
end

function ns.InitDB(reset)
  if reset or type(TomeOfTonguesDB) ~= "table" then TomeOfTonguesDB = {} end
  fillDefaults(TomeOfTonguesDB, DEFAULTS)
  ns.db = TomeOfTonguesDB
end

function ns.Lang() return ns.LANGS[ns.db.settings.lang] or ns.LANGS.sv end

function ns.Profile(code)
  code = code or ns.Lang().code
  local p = ns.db.langs[code]
  if type(p) ~= "table" then p = {}; ns.db.langs[code] = p end
  fillDefaults(p, PROFILE_DEFAULTS)
  return p
end

function ns.ResetProfile(code)
  ns.db.langs[code or ns.Lang().code] = nil
end

function ns.WordStats(fx, create, code)
  local P = ns.Profile(code)
  local w = P.words[fx]
  if not w and create then
    w = { seen = 0, right = 0, wrong = 0, streak = 0 }
    P.words[fx] = w
  end
  return w
end

function ns.IsMastered(fx, code)
  local w = ns.Profile(code).words[fx]
  return w and w.streak >= ns.MASTERY_STREAK
end

---------------------------------------------------------------------------
-- Display helpers
---------------------------------------------------------------------------
local PLAIN = {}
do
  local pairsList = {
    "à","a","á","a","â","a","ã","a","ä","a","å","a","æ","ae","ç","c","è","e","é","e","ê","e","ë","e",
    "ì","i","í","i","î","i","ï","i","ñ","n","ò","o","ó","o","ô","o","õ","o","ö","o","ø","o",
    "ù","u","ú","u","û","u","ü","u","ý","y","ÿ","y","ß","ss","œ","oe",
    "À","A","Á","A","Â","A","Ã","A","Ä","A","Å","A","Æ","AE","Ç","C","È","E","É","E","Ê","E","Ë","E",
    "Ì","I","Í","I","Î","I","Ï","I","Ñ","N","Ò","O","Ó","O","Ô","O","Õ","O","Ö","O","Ø","O",
    "Ù","U","Ú","U","Û","U","Ü","U","Ý","Y","Œ","OE",
  }
  for k = 1, #pairsList, 2 do PLAIN[pairsList[k]] = pairsList[k + 1] end
end

-- What a foreign word looks like on screen (accent stripping if enabled)
function ns.Display(s)
  if ns.db and ns.db.settings.plain then
    return (s:gsub("[\194-\223][\128-\191]", PLAIN))
  end
  return s
end

---------------------------------------------------------------------------
-- Progression model
---------------------------------------------------------------------------
-- Fraction of eligible words that get swapped. Smooth curve: ~4% at level 0,
-- ~25% at 40, ~55% at 70, ~90% at 100.
function ns.ReplaceRate(level)
  level = level or ns.Profile().level
  return 0.04 + 0.86 * (level / 100) ^ 1.4
end

function ns.SentenceChance(level)
  level = level or ns.Profile().level
  if level < ns.SENTENCE_MODE_LEVEL then return 0 end
  return 0.15 + 0.6 * (level - ns.SENTENCE_MODE_LEVEL) / (100 - ns.SENTENCE_MODE_LEVEL)
end

function ns.MaxTier(level)
  level = level or ns.Profile().level
  local t = 1
  for tier = 1, 5 do if level >= ns.TIER_UNLOCK[tier] then t = tier end end
  return t
end

function ns.Rank(level)
  level = level or ns.Profile().level
  local r = ns.RANKS[1]
  for _, rank in ipairs(ns.RANKS) do if level >= rank[1] then r = rank end end
  return r
end

-- result: "correct" | "close" | "wrong" | "skip"
function ns.RecordAnswer(fx, result, code)
  local P = ns.Profile(code)
  local S = P.skill
  local ok = (result == "correct" or result == "close")

  -- Raw skill reacts to every answer...
  if result == "correct" then
    S = S + 2.0 * (1 - S / 115)          -- gains shrink as you approach the top
  elseif result == "close" then
    S = S + 1.4 * (1 - S / 115)
  elseif result == "wrong" then
    S = S - (1.2 + 2.0 * S / 100)        -- the higher you are, the further you fall
  else -- skip / "don't know"
    S = S - (0.6 + 1.0 * S / 100)
  end
  P.skill = max(0, min(100, S))
  -- ...and the level that drives word swapping glides after it (smooth regression).
  P.level = P.level + 0.3 * (P.skill - P.level)

  P.answered = P.answered + 1
  if ok then P.correct = P.correct + 1 end
  P.recent = P.recent * 0.88 + (ok and 0.12 or 0)
  P.streak = ok and (P.streak + 1) or 0
  if P.streak > P.bestStreak then P.bestStreak = P.streak end

  local w = ns.WordStats(fx, true, code)
  if ok then
    w.right = w.right + 1
    w.streak = w.streak + 1
  else
    w.wrong = w.wrong + 1
    w.streak = 0
  end

  tinsert(P.history, P.level)
  while #P.history > ns.HISTORY_SIZE do table.remove(P.history, 1) end
end

---------------------------------------------------------------------------
-- Answer checking
---------------------------------------------------------------------------
local function levenshtein(a, b)
  local la, lb = #a, #b
  if la == 0 then return lb end
  if lb == 0 then return la end
  -- optimal string alignment: insert/delete/substitute + swapping two neighbours
  local d = {}
  for i = 0, la do d[i] = { [0] = i } end
  for j = 0, lb do d[0][j] = j end
  for i = 1, la do
    for j = 1, lb do
      local cost = (a:byte(i) == b:byte(j)) and 0 or 1
      local v = min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + cost)
      if i > 1 and j > 1 and a:byte(i) == b:byte(j - 1) and a:byte(i - 1) == b:byte(j) then
        v = min(v, d[i - 2][j - 2] + 1)
      end
      d[i][j] = v
    end
  end
  return d[la][lb]
end
ns.levenshtein = levenshtein

local function allowedTypos(word, input)
  local n = #word
  if n <= 3 then
    -- short words: only a swapped letter pair counts ("dgo" for "dog")
    if #input == n and n > 1 then
      for k = 1, n - 1 do
        if input == word:sub(1, k - 1) .. word:sub(k + 1, k + 1) .. word:sub(k, k) .. word:sub(k + 2) then return 1 end
      end
    end
    return 0
  elseif n <= 6 then return 1 else return 2 end
end

local SUFFIXES = { "s", "es", "ed", "d", "ing", "ly" }

local function closeForm(input, ans)
  for _, suf in ipairs(SUFFIXES) do
    if input == ans .. suf or ans == input .. suf then return true end
  end
  return false
end

-- Returns "correct", "close" (right meaning, a bit misspelled), or "wrong",
-- plus the best-matching accepted answer.
function ns.CheckAnswer(fx, input, code)
  local lang = ns.LANGS[code] or ns.Lang()
  local accepted = lang.answers[fx]
  if not accepted then return "wrong" end
  local bestClose
  for piece in (input or ""):gmatch("[^/,;]+") do
    local n = normalize(piece)
    if n ~= "" then
      if accepted[n] then return "correct", n end
      for ans in pairs(accepted) do
        if closeForm(n, ans) then return "correct", ans end
        if levenshtein(n, ans) <= allowedTypos(ans, n) then bestClose = bestClose or ans end
      end
    end
  end
  if bestClose then return "close", bestClose end
  return "wrong"
end

function ns.AnswersFor(fx, code)
  local lang = ns.LANGS[code] or ns.Lang()
  local list = {}
  for ans in pairs(lang.answers[fx] or {}) do list[#list + 1] = ans end
  tsort(list, function(a, b) return #a < #b end)
  return list
end

---------------------------------------------------------------------------
-- Text transformation
---------------------------------------------------------------------------
-- Uppercase the first letter, including accented Latin letters.
local function capFirst(s)
  local b1, b2 = s:byte(1, 2)
  if b1 and b2 and b1 >= 194 and b1 <= 223 then
    local cp = (b1 - 192) * 64 + (b2 - 128)
    local up = cp
    if cp >= 0xE0 and cp <= 0xFE and cp ~= 0xF7 then up = cp - 32
    elseif (cp >= 0x100 and cp <= 0x137) or (cp >= 0x14A and cp <= 0x177) then
      if cp % 2 == 1 then up = cp - 1 end
    elseif (cp >= 0x139 and cp <= 0x148) or (cp >= 0x179 and cp <= 0x17E) then
      if cp % 2 == 0 then up = cp - 1 end
    end
    if up ~= cp then
      return string.char(192 + floor(up / 64), 128 + up % 64) .. s:sub(3)
    end
    return s
  end
  return s:sub(1, 1):upper() .. s:sub(2)
end
ns.capFirst = capFirst

local function matchCase(orig, fx, atSentenceStart)
  if orig == "I" then return atSentenceStart and capFirst(fx) or fx end
  if #orig > 1 and orig == orig:upper() then return fx:upper() end
  if orig:sub(1, 1):match("%u") then return capFirst(fx) end
  return fx
end

-- WoW escape sequences we must never touch (colors, links, textures, newlines).
local ESCAPES = {
  "^|c%x%x%x%x%x%x%x%x", "^|r", "^|n", "^||",
  "^|H.-|h.-|h", "^|T.-|t", "^|A.-|a", "^|K.-|k",
}

-- Split text into { {w=string, word=bool}, ... }
local function tokenize(text)
  local tokens, pos, len = {}, 1, #text
  local sep = {}
  local function flushSep()
    if #sep > 0 then tokens[#tokens + 1] = { w = table.concat(sep) }; sep = {} end
  end
  while pos <= len do
    local c = text:sub(pos, pos)
    if c:match("%a") then
      local s, e = text:find("^%a[%a']*", pos)
      local w = text:sub(s, e)
      local core, trail = w:match("^(.-)('*)$")
      flushSep()
      tokens[#tokens + 1] = { w = core, word = true }
      if trail ~= "" then sep[#sep + 1] = trail end
      pos = e + 1
    elseif c == "|" then
      local consumed = false
      for _, pat in ipairs(ESCAPES) do
        local s, e = text:find(pat, pos)
        if s then sep[#sep + 1] = text:sub(s, e); pos = e + 1; consumed = true; break end
      end
      if not consumed then sep[#sep + 1] = c; pos = pos + 1 end
    else
      local s, e = text:find("^[^%a|]+", pos)
      sep[#sep + 1] = text:sub(s, e)
      pos = e + 1
    end
  end
  flushSep()
  return tokens
end
ns.tokenize = tokenize

local function endsSentence(sepText)
  return sepText:find("[%.%!%?]") or sepText:find("|n") or sepText:find("\n")
end

function ns.NewContext()
  local lang = ns.Lang()
  local L = ns.Profile(lang.code).level
  return {
    lang = lang,
    level = L,
    rate = ns.ReplaceRate(L),
    maxTier = ns.MaxTier(L),
    sentenceChance = ns.SentenceChance(L),
    newCap = 1 + floor(L / 20),   -- brand-new words introduced per dialogue
    new = 0,
    replaced = {},                -- [foreign] = english original
    order = {},
  }
end

-- Should this dictionary entry be swapped right now?
local function decide(entry, ctx, forced)
  if forced then return true end
  if entry.tier > ctx.maxTier then return false end
  local w = ns.Profile(ctx.lang.code).words[entry.fx]
  if not w or w.seen == 0 then
    if ctx.new >= ctx.newCap then return false end
    if random() < ctx.rate * 1.2 then ctx.new = ctx.new + 1; return true end
    return false
  end
  local p = ctx.rate
  if w.streak >= ns.MASTERY_STREAK then p = p * 1.3 end   -- known words show up more
  if w.wrong > w.right then p = p * 1.15 end              -- and weak ones get practice
  return random() < min(0.97, p)
end

local function emit(ctx, entry, original, atStart)
  local out = matchCase(original, ns.Display(entry.fx), atStart)
  if not ctx.replaced[entry.fx] then
    ctx.replaced[entry.fx] = entry.en
    tinsert(ctx.order, entry.fx)
  end
  local w = ns.WordStats(entry.fx, true, ctx.lang.code)
  w.seen = w.seen + 1
  if ns.db.settings.color then
    out = "|c" .. ns.db.settings.colorHex .. out .. "|r"
  end
  return out
end

function ns.Transform(text, ctx)
  if not text or text == "" or not ns.db.settings.enabled then return text end
  ctx = ctx or ns.NewContext()
  local lang = ctx.lang
  local tokens = tokenize(text)
  local out = {}
  local atStart = true
  local forced = ctx.sentenceChance > 0 and random() < ctx.sentenceChance
  local i, n = 1, #tokens

  while i <= n do
    local tok = tokens[i]
    if not tok.word then
      out[#out + 1] = tok.w
      if endsSentence(tok.w) then
        atStart = true
        forced = ctx.sentenceChance > 0 and random() < ctx.sentenceChance
      end
      i = i + 1
    else
      local lower = tok.w:lower()
      local done = false

      -- phrases first (longest match)
      local phrases = lang.phrasesByFirst[lower]
      if phrases then
        for _, ph in ipairs(phrases) do
          local j, ok = i, true
          for k = 2, #ph.parts do
            local sepTok, wordTok = tokens[j + 1], tokens[j + 2]
            if not sepTok or sepTok.word or not sepTok.w:match("^%s+$")
              or not wordTok or not wordTok.word or wordTok.w:lower() ~= ph.parts[k] then
              ok = false; break
            end
            j = j + 2
          end
          if ok then
            if decide(ph, ctx, forced) then
              out[#out + 1] = emit(ctx, ph, tok.w, atStart)
            else
              -- keep the phrase whole in English rather than half-translating it
              for k = i, j do out[#out + 1] = tokens[k].w end
            end
            i = j + 1
            done = true
            break
          end
        end
      end

      if not done then
        local entry = lang.words[lower]
        if entry and decide(entry, ctx, forced) then
          out[#out + 1] = emit(ctx, entry, tok.w, atStart)
        else
          out[#out + 1] = tok.w
        end
        i = i + 1
      end
      atStart = false
    end
  end
  return table.concat(out), ctx
end

-- Pick which swapped words to quiz the player on.
function ns.PickQuizWords(ctx)
  local picks = {}
  if not ns.db.settings.quiz then return picks end
  local code = ctx.lang.code
  local P = ns.Profile(code)
  local cands = {}
  for _, fx in ipairs(ctx.order) do
    local w = P.words[fx]
    local answered = w and (w.right + w.wrong) or 0
    local mastered = ns.IsMastered(fx, code)
    if not mastered or random() < 0.2 then
      local prio = (answered == 0 and 0 or 1) + (mastered and 2 or 0) + random() * 0.5
      tinsert(cands, { fx = fx, en = ctx.replaced[fx], lang = code, prio = prio })
    end
  end
  tsort(cands, function(a, b) return a.prio < b.prio end)
  for k = 1, min(#cands, ns.db.settings.maxQuiz) do tinsert(picks, cands[k]) end
  return picks
end
