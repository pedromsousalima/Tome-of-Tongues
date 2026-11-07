-- Tome of Tongues - Dutch.lua
-- One "english = dutch" per entry (entries separated by ";" or new lines).
-- The English side must match a word from Swedish.lua, which sets its tier
-- and the extra accepted answers. Verbs are in the infinitive.
-- Corrections from native speakers are very welcome!

local _, ns = ...

ns.AddLanguage("nl", "Dutch", "Nederlands", [[
-- tier 1: basics
and = en; or = of; but = maar; yes = ja; no = nee
i = ik; you = jij; he = hij; she = zij; we = wij; they = zij; it = het; my = mijn; your = jouw
are = zijn; am = ben; were = waren; not = niet
here = hier; there = daar; now = nu
good = goed; bad = slecht; big = groot; large = groot; small = klein; little = klein
woman = vrouw; friend = vriend; enemy = vijand; day = dag; night = nacht
fire = vuur; food = eten; dog = hond; cat = kat; bear = beer; king = koning
gold = goud; help = hulp; hello = hallo; greetings = groeten
with = met; from = van; on = op
what = wat; who = wie; where = waar; when = wanneer; why = waarom; how = hoe
one = een; two = twee; three = drie

-- tier 2: common nouns & verbs
me = mij; him = hem; her = haar; us = ons; them = hen; our = onze; their = hun; his = zijn
for = voor; of = van; have = hebben; has = heeft
can = kunnen; will = zullen; must = moeten; want = willen; need = nodig hebben; know = weten; think = denken
go = gaan; come = komen; take = nemen; give = geven; get = krijgen
kill = doden; slay = verslaan; find = vinden; see = zien; speak = spreken; talk = praten
return = terugkeren; bring = brengen; make = maken; look = kijken; wait = wachten; eat = eten; drink = drinken
man's = van de man; men = mannen; women = vrouwen; child = kind; children = kinderen
friends = vrienden; enemies = vijanden; days = dagen; time = tijd; year = jaar; years = jaren; world = wereld
home = thuis; house = huis; town = stad; city = stad; village = dorp; road = weg; path = pad
forest = bos; woods = bos; tree = boom; trees = bomen; mountain = berg; mountains = bergen
river = rivier; lake = meer; sea = zee
head = hoofd; eye = oog; eyes = ogen; heart = hart; blood = bloed; bone = bot; bones = botten
meat = vlees; fish = vis; bread = brood
horse = paard; wolves = wolven; bears = beren; spider = spin; spiders = spinnen; bird = vogel
boar = everzwijn; boars = everzwijnen
sword = zwaard; shield = schild; axe = bijl; queen = koningin; guard = wacht; guards = wachters
soldier = soldaat; soldiers = soldaten; people = mensen
four = vier; five = vijf; six = zes; seven = zeven; eight = acht; nine = negen; ten = tien
thanks = bedankt; please = alsjeblieft; sorry = het spijt me; welcome = welkom; goodbye = tot ziens

-- tier 3: adjectives, adverbs, more verbs
very = zeer; much = veel; many = veel; few = weinig; all = alle; every = elke; each = elk
some = sommige; other = ander; more = meer; also = ook; again = weer
always = altijd; never = nooit; soon = binnenkort; still = nog; already = al
perhaps = misschien; maybe = misschien; only = alleen; just = gewoon; today = vandaag; tomorrow = morgen
without = zonder; these = deze; something = iets; nothing = niets; everything = alles; someone = iemand; everyone = iedereen
long = lang; short = kort; strong = sterk; weak = zwak; fast = snel; quick = vlug; quickly = snel; slow = langzaam
dark = donker; light = licht; cold = koud; hot = heet; young = jong; old = oud; new = nieuw
beautiful = mooi; evil = kwaad; brave = dapper; poor = arm; rich = rijk; dangerous = gevaarlijk
safe = veilig; sure = zeker; true = waar; wrong = fout; easy = makkelijk; hard = zwaar; difficult = moeilijk
free = vrij; empty = leeg; strange = vreemd; important = belangrijk; ready = klaar
tired = moe; angry = boos; happy = blij; sad = verdrietig; hungry = hongerig; dead = dood; alive = levend
red = rood; blue = blauw; green = groen; black = zwart; white = wit; first = eerste; last = laatste
north = noorden; south = zuiden; east = oosten; west = westen
say = zeggen; said = zei; tell = vertellen; ask = vragen; hear = horen; believe = geloven
remember = herinneren; forget = vergeten; learn = leren; buy = kopen; sell = verkopen; pay = betalen
open = openen; begin = beginnen; start = starten; collect = verzamelen; gather = verzamelen
protect = beschermen; defend = verdedigen; save = redden; rescue = bevrijden; destroy = vernietigen
attack = aanvallen; fight = vechten; travel = reizen; send = sturen; search = zoeken; seek = opzoeken
run = rennen; sleep = slapen; die = sterven; love = houden van; hate = haten; deliver = bezorgen; use = gebruiken

-- tier 4: Azeroth vocabulary
adventurer = avonturier; stranger = vreemdeling; hero = held; champion = kampioen; master = meester; lord = heer
priest = priester; mage = magiër; warrior = krijger; hunter = jager; thief = dief; thieves = dieven; farmer = boer
brother = broer; sister = zus; father = vader; mother = moeder; daughter = dochter; family = familie
door = deur; key = sleutel; box = doos; crate = krat; book = boek; letter = brief; map = kaart
ship = schip; boat = boot; bridge = brug; tower = toren; castle = kasteel; church = kerk
farm = boerderij; field = veld; fields = velden; cave = grot; camp = kamp
war = oorlog; peace = vrede; battle = strijd; army = leger; kingdom = koninkrijk; crown = kroon; throne = troon
dragon = draak; dragons = draken; ghost = spook; spirit = geest; spirits = geesten
creature = wezen; creatures = wezens; beast = beest; beasts = beesten; undead = ondode
orc = ork; orcs = orks; dwarf = dwerg; dwarves = dwergen; elves = elfen; human = mens; humans = mensen
magic = magie; power = macht; strength = kracht; shadow = schaduw; shadows = schaduwen; darkness = duisternis
death = dood; life = leven; flame = vlam; flames = vlammen; ice = ijs; snow = sneeuw; rain = regen
stone = steen; stones = stenen; earth = aarde; sky = hemel; sun = zon; moon = maan; star = ster; ash = as
leather = leer; cloth = stof; pelt = vacht; pelts = vachten; fur = bont
egg = ei; eggs = eieren; milk = melk; apple = appel; flower = bloem; flowers = bloemen
herb = kruid; herbs = kruiden; wheat = tarwe; potion = drankje
message = bericht; news = nieuws; task = taak; quest = queeste; mission = missie; reward = beloning
money = geld; coin = munt; coins = munten; weapon = wapen; weapons = wapens; armor = harnas
supplies = voorraden; ore = erts; iron = ijzer; cloak = mantel; bandits = bandieten
twenty = twintig; hundred = honderd; thousand = duizend
farewell = vaarwel; indeed = inderdaad; quiet = stil; together = samen
near = dichtbij; far = ver; inside = binnen; outside = buiten; behind = achter; under = onder; against = tegen; between = tussen

-- tier 5: phrases
thank you = dank je; good luck = veel succes; of course = natuurlijk; i don't know = ik weet het niet
be careful = wees voorzichtig; come back = kom terug; right now = nu meteen
good day = goedendag; good morning = goedemorgen; good evening = goedenavond
well done = goed gedaan; too late = te laat; excuse me = pardon; at once = onmiddellijk
there is = er is; there are = er zijn; each other = elkaar; long ago = lang geleden
i am = ik ben; i'm = ik ben; you are = jij bent; you're = jij bent; it is = het is; it's = het is
safe travels = goede reis; what do you want = wat wil je
how can i help you = hoe kan ik je helpen; how may i help you = hoe kan ik u helpen
]])
