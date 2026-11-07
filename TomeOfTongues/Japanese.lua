-- Tome of Tongues - Japanese.lua (romaji)
-- One "english = japanese" per entry (entries separated by ";" or new lines).
-- Written in romaji (Latin letters) because the English game font can't draw
-- Japanese script. The English side must match a word from Swedish.lua, which
-- sets its tier and the extra accepted answers. Verbs are in dictionary form.
-- Corrections from native speakers are very welcome!

local _, ns = ...

ns.AddLanguage("ja", "Japanese", "Nihongo", [[
-- tier 1: basics
and = to; or = ka; but = demo; yes = hai; no = iie
i = watashi; you = anata; he = kare; she = kanojo; we = watashitachi; they = karera; it = sore
my = watashi no; your = anata no
is = desu; are = desu; am = desu; was = deshita; were = deshita; not = nai
here = koko; there = soko; now = ima
good = ii; bad = warui; big = ookii; large = ookii; small = chiisai; little = chiisai
man = otoko; woman = onna; friend = tomodachi; enemy = teki; day = hiru; night = yoru
water = mizu; fire = hi; food = tabemono; dog = inu; cat = neko; wolf = ookami; bear = kuma; king = ou
gold = kin; help = tasuke; hello = konnichiwa; greetings = aisatsu
with = to issho ni; from = kara; in = naka; on = ue
what = nani; who = dare; where = doko; when = itsu; why = naze; how = dou
one = ichi; two = ni; three = san

-- tier 2: common nouns & verbs
me = watashi; him = kare; her = kanojo; us = watashitachi; them = karera
our = watashitachi no; their = karera no; his = kare no
for = tame ni; of = no; have = motsu; has = motte iru; had = motte ita
can = dekiru; will = deshou; must = nakereba naranai; want = hoshii; need = hitsuyou; know = shiru; think = omou
go = iku; come = kuru; take = toru; give = ageru; get = morau
kill = korosu; slay = uchitoru; find = mitsukeru; see = miru; speak = hanasu; talk = shaberu
return = modoru; bring = motte kuru; make = tsukuru; look = nagameru; wait = matsu; eat = taberu; drink = nomu
man's = otoko no; men = otokotachi; women = onnatachi; child = kodomo; children = kodomotachi
friends = nakama; enemies = tekitachi; days = hibi; time = jikan; year = toshi; years = nen; world = sekai
home = ie; house = uchi; town = machi; city = tokai; village = mura; road = michi; path = komichi
forest = mori; woods = hayashi; tree = ki; trees = kigi; mountain = yama; mountains = yamayama
river = kawa; lake = mizuumi; sea = umi
head = atama; eye = me; eyes = me; heart = kokoro; blood = chi; bone = hone; bones = hone
meat = niku; fish = sakana; bread = pan
horse = uma; wolves = ookami no mure; bears = kumatachi; spider = kumo; spiders = kumo; bird = tori
boar = inoshishi; boars = inoshishi
sword = ken; shield = tate; axe = ono; queen = joou; guard = eihei; guards = eihei
soldier = heishi; soldiers = heishitachi; people = hitobito
four = yon; five = go; six = roku; seven = nana; eight = hachi; nine = kyuu; ten = juu
thanks = arigatou; please = onegaishimasu; sorry = gomen nasai; welcome = youkoso; goodbye = sayounara

-- tier 3: adjectives, adverbs, more verbs
very = totemo; much = takusan; many = ooku; few = sukoshi; all = subete; every = mai; each = sorezore
some = ikutsuka; other = hoka; more = motto; also = mo; again = mata
always = itsumo; never = kesshite; soon = sugu; still = mada; already = mou
perhaps = tabun; maybe = tabun; only = dake; just = tada; today = kyou; tomorrow = ashita
without = nashi de; these = korera; something = nanika; nothing = nanimo; everything = zenbu
someone = dareka; everyone = minna
long = nagai; short = mijikai; strong = tsuyoi; weak = yowai; fast = hayai; quick = hayai; quickly = hayaku; slow = osoi
dark = kurai; light = akarui; cold = samui; warm = atatakai; hot = atsui; young = wakai; old = furui; new = atarashii
beautiful = utsukushii; evil = jaaku; brave = yuukan; poor = mazushii; rich = yutaka; dangerous = abunai
safe = anzen; sure = tashika; true = hontou; wrong = machigai; easy = kantan; hard = katai; difficult = muzukashii
free = jiyuu; empty = karappo; strange = hen; important = taisetsu; ready = junbi dekita
tired = tsukareta; angry = okotta; happy = ureshii; sad = kanashii; hungry = onaka ga suita; dead = shinda; alive = ikite iru
red = akai; blue = aoi; green = midori; black = kuroi; white = shiroi; first = saisho; last = saigo
north = kita; south = minami; east = higashi; west = nishi
say = iu; said = itta; tell = tsutaeru; ask = tazuneru; hear = kiku; believe = shinjiru
remember = oboeru; forget = wasureru; learn = manabu; buy = kau; sell = uru; pay = harau
open = akeru; begin = hajimeru; start = hajimeru; collect = atsumeru; gather = atsumeru
protect = mamoru; defend = fusegu; save = sukuu; rescue = tasukeru; destroy = hakai suru
attack = kougeki suru; fight = tatakau; travel = tabi suru; send = okuru; search = sagasu; seek = motomeru
run = hashiru; sleep = nemuru; die = shinu; love = aisuru; hate = nikumu; deliver = todokeru; use = tsukau

-- tier 4: Azeroth vocabulary
adventurer = boukensha; stranger = yosomono; hero = eiyuu; champion = yuusha; master = shishou; lord = ryoushu
priest = shisai; mage = madoushi; warrior = senshi; hunter = karyuudo; thief = dorobou; thieves = dorobou; farmer = noufu
brother = ani; sister = ane; father = chichi; mother = haha; daughter = musume; family = kazoku
door = tobira; key = kagi; box = hako; crate = kibako; book = hon; letter = tegami; map = chizu
ship = fune; boat = kobune; bridge = hashi; tower = tou; castle = shiro; church = kyoukai
farm = noujou; field = hatake; fields = hatake; cave = doukutsu; camp = yaei
war = sensou; peace = heiwa; battle = tatakai; army = guntai; kingdom = oukoku; crown = kanmuri; throne = gyokuza
dragon = ryuu; dragons = ryuu; ghost = yuurei; spirit = rei; spirits = rei
creature = ikimono; creatures = ikimono; beast = kemono; beasts = kemono; undead = fushi no mono
orc = ooku; orcs = ooku; dwarf = dowaafu; dwarves = dowaafu; elf = erufu; elves = erufu; human = ningen; humans = ningen
magic = mahou; power = chikara; strength = tsuyosa; shadow = kage; shadows = kage; darkness = yami
death = shi; life = inochi; flame = honoo; flames = honoo; ice = koori; snow = yuki; rain = ame; wind = kaze
stone = ishi; stones = ishi; earth = tsuchi; sky = sora; sun = taiyou; moon = tsuki; star = hoshi
leather = hikaku; cloth = nuno; pelt = kegawa; pelts = kegawa; fur = ke
egg = tamago; eggs = tamago; milk = gyuunyuu; apple = ringo; flower = hana; flowers = hana
herb = yakusou; herbs = yakusou; wheat = komugi; potion = kusuri
message = dengon; news = shirase; task = shigoto; quest = ninmu; mission = ninmu; reward = houshuu
money = okane; coin = kouka; coins = kouka; weapon = buki; weapons = buki; armor = yoroi
supplies = busshi; ore = kouseki; iron = tetsu; cloak = manto; bandits = touzoku
twenty = nijuu; hundred = hyaku; thousand = sen
farewell = saraba; indeed = tashika ni; quiet = shizuka; together = issho ni
near = chikai; far = tooi; inside = uchigawa; outside = soto; behind = ushiro; under = shita; against = hantai; between = aida

-- tier 5: phrases
thank you = arigatou gozaimasu; good luck = ganbatte; of course = mochiron; i don't know = wakarimasen
be careful = ki wo tsukete; come back = modotte kite; right now = ima sugu
good day = konnichiwa; good morning = ohayou gozaimasu; good evening = konbanwa
well done = yoku yatta; too late = ososugiru; excuse me = sumimasen; at once = tadachi ni
there is = aru; there are = aru; each other = otagai; long ago = mukashi
i am = watashi wa; i'm = watashi wa; you are = anata wa; you're = anata wa; it is = sore wa; it's = sore wa
safe travels = yoi tabi wo; what do you want = nani ga hoshii
how can i help you = nani ka otetsudai shimashou ka; how may i help you = nani ka otetsudai shimashou ka
]], "Shown in romaji (Latin letters) because the English game font can't draw Japanese script.")
