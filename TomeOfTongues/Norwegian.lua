-- Tome of Tongues - Norwegian.lua (Bokmål)
-- One "english = norwegian" per entry (entries separated by ";" or new lines).
-- The English side must match a word from Swedish.lua, which sets its tier
-- and the extra accepted answers. Verbs are in the infinitive.
-- Corrections from native speakers are very welcome!

local _, ns = ...

ns.AddLanguage("no", "Norwegian", "Norsk", [[
-- tier 1: basics
and = og; or = eller; but = men; yes = ja; no = nei
i = jeg; you = du; he = han; she = hun; we = vi; they = de; it = det; my = min; your = din
is = er; are = er; am = er; was = var; were = var; not = ikke
here = her; there = der; now = nå
good = bra; bad = dårlig; big = stor; large = stor; small = liten; little = liten
man = mann; woman = kvinne; friend = venn; enemy = fiende; day = dag; night = natt
water = vann; fire = ild; food = mat; dog = hund; cat = katt; wolf = ulv; bear = bjørn; king = konge
gold = gull; help = hjelp; hello = hei; greetings = hilsener
with = med; from = fra; in = i; on = på
what = hva; who = hvem; where = hvor; when = når; why = hvorfor; how = hvordan
one = en; two = to; three = tre

-- tier 2: common nouns & verbs
me = meg; him = ham; her = henne; us = oss; them = dem; our = vår; their = deres; his = hans
of = av; have = ha; has = har; had = hadde
can = kan; will = skal; must = må; want = vil; need = trenger; know = vet; think = tror
go = gå; come = komme; take = ta; give = gi; get = få
kill = drepe; slay = felle; find = finne; see = se; speak = snakke; talk = prate
return = vende tilbake; bring = hente; make = lage; look = titte; wait = vente; eat = spise; drink = drikke
man's = mannens; men = menn; women = kvinner; child = barn; children = barn
friends = venner; enemies = fiender; days = dager; time = tid; year = år; years = år; world = verden
home = hjem; house = hus; town = by; city = by; village = landsby; road = vei; path = sti
forest = skog; woods = skog; tree = tre; trees = trær; mountain = fjell; mountains = fjell
river = elv; lake = innsjø; sea = hav
head = hode; eye = øye; eyes = øyne; heart = hjerte; blood = blod; bone = bein; bones = bein
meat = kjøtt; fish = fisk; bread = brød
horse = hest; wolves = ulver; bears = bjørner; spider = edderkopp; spiders = edderkopper; bird = fugl
boar = villsvin; boars = villsvin
sword = sverd; shield = skjold; axe = øks; queen = dronning; guard = vakt; guards = vakter
soldier = soldat; soldiers = soldater; people = folk
four = fire; five = fem; six = seks; seven = sju; eight = åtte; nine = ni; ten = ti
thanks = takk; please = vær så snill; sorry = unnskyld; welcome = velkommen; goodbye = ha det

-- tier 3: adjectives, adverbs, more verbs
very = veldig; much = mye; many = mange; few = få; all = alle; every = hver; each = hver
some = noen; other = andre; more = mer; also = også; again = igjen
always = alltid; never = aldri; soon = snart; still = fortsatt; already = allerede
perhaps = kanskje; maybe = kanskje; only = bare; just = bare; today = i dag; tomorrow = i morgen
without = uten; these = disse; something = noe; nothing = ingenting; everything = alt; someone = noen; everyone = alle
long = lang; short = kort; strong = sterk; weak = svak; fast = rask; quick = kjapp; quickly = raskt; slow = langsom
dark = mørk; light = lys; cold = kald; warm = varm; hot = het; young = ung; old = gammel; new = ny
beautiful = vakker; evil = ond; brave = modig; poor = fattig; rich = rik; dangerous = farlig
safe = trygg; sure = sikker; true = sann; wrong = feil; easy = lett; hard = tung; difficult = vanskelig
free = fri; empty = tom; strange = rar; important = viktig; ready = klar
tired = trøtt; angry = sint; happy = glad; sad = lei seg; hungry = sulten; dead = død; alive = levende
red = rød; blue = blå; green = grønn; black = svart; white = hvit; first = første; last = siste
north = nord; south = sør; east = øst; west = vest
say = si; said = sa; tell = fortelle; ask = spørre; hear = høre; believe = tro
remember = huske; forget = glemme; learn = lære; buy = kjøpe; sell = selge; pay = betale
open = åpne; begin = begynne; start = starte; collect = samle; gather = samle
protect = beskytte; defend = forsvare; save = redde; rescue = redde; destroy = ødelegge
attack = angripe; fight = slåss; travel = reise; send = sende; search = lete; seek = søke
run = løpe; sleep = sove; die = dø; love = elske; deliver = levere; use = bruke

-- tier 4: Azeroth vocabulary
adventurer = eventyrer; stranger = fremmed; hero = helt; champion = mester; master = mester; lord = herre
priest = prest; mage = magiker; warrior = kriger; hunter = jeger; thief = tyv; thieves = tyver; farmer = bonde
brother = bror; sister = søster; father = far; mother = mor; daughter = datter; family = familie
door = dør; key = nøkkel; box = boks; crate = kasse; book = bok; letter = brev; map = kart
ship = skip; boat = båt; bridge = bro; tower = tårn; castle = slott; church = kirke
farm = gård; field = åker; fields = åkrer; cave = hule; camp = leir
war = krig; peace = fred; battle = slag; army = hær; kingdom = kongerike; crown = krone; throne = trone
dragon = drage; dragons = drager; ghost = spøkelse; spirit = ånd; spirits = ånder
creature = skapning; creatures = skapninger; beast = beist; beasts = beist; undead = vandød
orc = ork; orcs = orker; dwarf = dverg; dwarves = dverger; elf = alv; elves = alver; human = menneske; humans = mennesker
magic = magi; power = makt; strength = styrke; shadow = skygge; shadows = skygger; darkness = mørke
death = død; life = liv; flame = flamme; flames = flammer; ice = is; snow = snø; rain = regn; wind = vind
stone = stein; stones = steiner; earth = jord; sky = himmel; sun = sol; moon = måne; star = stjerne; ash = aske
leather = lær; cloth = tøy; pelt = skinn; pelts = skinn; fur = pels
eggs = egg; milk = melk; apple = eple; flower = blomst; flowers = blomster
herb = urt; herbs = urter; wheat = hvete; potion = eliksir
message = beskjed; news = nyheter; task = oppgave; quest = oppdrag; mission = oppdrag; reward = belønning
money = penger; coin = mynt; coins = mynter; weapon = våpen; weapons = våpen; armor = rustning
supplies = forsyninger; ore = malm; iron = jern; cloak = kappe; bandits = banditter
twenty = tjue; hundred = hundre; thousand = tusen
farewell = farvel; indeed = virkelig; quiet = stille; together = sammen
near = nær; far = langt; inside = inni; outside = utenfor; behind = bak; against = mot; between = mellom

-- tier 5: phrases
thank you = tusen takk; good luck = lykke til; of course = selvfølgelig; i don't know = jeg vet ikke
be careful = vær forsiktig; come back = kom tilbake; right now = akkurat nå
good day = god dag; good morning = god morgen; good evening = god kveld
well done = godt gjort; too late = for sent; excuse me = unnskyld meg; at once = med en gang
there is = det finnes; there are = det finnes; each other = hverandre; long ago = for lenge siden
i am = jeg er; i'm = jeg er; you are = du er; you're = du er; it is = det er; it's = det er
safe travels = god tur; what do you want = hva vil du
how can i help you = hvordan kan jeg hjelpe deg; how may i help you = hvordan kan jeg hjelpe deg
]])
