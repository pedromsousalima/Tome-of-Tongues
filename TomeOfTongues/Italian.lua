-- Tome of Tongues - Italian.lua
-- One "english = italian" per entry (entries separated by ";" or new lines).
-- The English side must match a word from Swedish.lua, which sets its tier
-- and the extra accepted answers. Verbs are in the infinitive.
-- Corrections from native speakers are very welcome!

local _, ns = ...

ns.AddLanguage("it", "Italian", "Italiano", [[
-- tier 1: basics
and = e; or = o; but = ma; yes = sì
i = io; you = tu; he = lui; she = lei; we = noi; they = loro; it = esso; my = mio; your = tuo
is = è; are = sono; am = sono; was = era; were = erano; not = non
here = qui; there = là; now = ora
good = buono; bad = cattivo; big = grande; large = grande; small = piccolo; little = piccolo
man = uomo; woman = donna; friend = amico; enemy = nemico; day = giorno; night = notte
water = acqua; fire = fuoco; food = cibo; dog = cane; cat = gatto; wolf = lupo; bear = orso; king = re
gold = oro; help = aiuto; hello = ciao; greetings = saluti
with = con; from = da; on = su
what = cosa; who = chi; where = dove; when = quando; why = perché; how = come
one = uno; two = due; three = tre

-- tier 2: common nouns & verbs
him = lui; her = lei; us = noi; them = loro; our = nostro; their = loro; his = suo
for = per; of = di; have = avere; has = ha; had = aveva
can = potere; must = dovere; want = volere; need = avere bisogno; know = sapere; think = pensare
go = andare; come = venire; take = prendere; give = dare; get = ottenere
kill = uccidere; slay = trucidare; find = trovare; see = vedere; speak = parlare; talk = chiacchierare
return = tornare; bring = portare; make = fare; look = guardare; wait = aspettare; eat = mangiare; drink = bere
man's = dell'uomo; men = uomini; women = donne; child = bambino; children = bambini
friends = amici; enemies = nemici; days = giorni; time = tempo; year = anno; years = anni; world = mondo
home = casa; house = casa; town = paese; city = città; village = villaggio; road = strada; path = sentiero
forest = foresta; woods = bosco; tree = albero; trees = alberi; mountain = montagna; mountains = montagne
river = fiume; lake = lago; sea = mare
head = testa; eye = occhio; eyes = occhi; heart = cuore; blood = sangue; bone = osso; bones = ossa
meat = carne; fish = pesce; bread = pane
horse = cavallo; wolves = lupi; bears = orsi; spider = ragno; spiders = ragni; bird = uccello
boar = cinghiale; boars = cinghiali
sword = spada; shield = scudo; axe = ascia; queen = regina; guard = guardia; guards = guardie
soldier = soldato; soldiers = soldati; people = gente
four = quattro; five = cinque; six = sei; seven = sette; eight = otto; nine = nove; ten = dieci
thanks = grazie; please = per favore; sorry = scusa; welcome = benvenuto; goodbye = arrivederci

-- tier 3: adjectives, adverbs, more verbs
very = molto; much = molto; many = molti; few = pochi; all = tutti; every = ogni; each = ciascuno
some = alcuni; other = altro; more = più; also = anche; again = di nuovo
always = sempre; never = mai; soon = presto; still = ancora; already = già
perhaps = forse; maybe = forse; only = solo; just = soltanto; today = oggi; tomorrow = domani
without = senza; these = questi; something = qualcosa; nothing = niente; everything = tutto
someone = qualcuno; everyone = tutti
long = lungo; short = corto; strong = forte; weak = debole; fast = veloce; quick = rapido; quickly = velocemente; slow = lento
dark = scuro; light = chiaro; cold = freddo; warm = caldo; hot = bollente; young = giovane; old = vecchio; new = nuovo
beautiful = bello; evil = malvagio; brave = coraggioso; poor = povero; rich = ricco; dangerous = pericoloso
safe = sicuro; sure = certo; true = vero; wrong = sbagliato; easy = facile; hard = duro; difficult = difficile
free = libero; empty = vuoto; strange = strano; important = importante; ready = pronto
tired = stanco; angry = arrabbiato; happy = felice; sad = triste; hungry = affamato; dead = morto; alive = vivo
red = rosso; blue = blu; green = verde; black = nero; white = bianco; first = primo; last = ultimo
north = nord; south = sud; east = est; west = ovest
say = dire; said = disse; tell = raccontare; ask = chiedere; hear = sentire; believe = credere
remember = ricordare; forget = dimenticare; learn = imparare; buy = comprare; sell = vendere; pay = pagare
open = aprire; begin = cominciare; start = iniziare; collect = raccogliere; gather = radunare
protect = proteggere; defend = difendere; save = salvare; rescue = soccorrere; destroy = distruggere
attack = attaccare; fight = combattere; travel = viaggiare; send = mandare; search = cercare; seek = ricercare
run = correre; sleep = dormire; die = morire; love = amare; hate = odiare; deliver = consegnare; use = usare

-- tier 4: Azeroth vocabulary
adventurer = avventuriero; stranger = straniero; hero = eroe; champion = campione; master = maestro; lord = signore
priest = sacerdote; mage = mago; warrior = guerriero; hunter = cacciatore; thief = ladro; thieves = ladri; farmer = contadino
brother = fratello; sister = sorella; father = padre; mother = madre; daughter = figlia; family = famiglia
door = porta; key = chiave; box = scatola; crate = cassa; book = libro; letter = lettera; map = mappa
ship = nave; boat = barca; bridge = ponte; tower = torre; castle = castello; church = chiesa
farm = fattoria; field = campo; fields = campi; cave = grotta; camp = accampamento
war = guerra; peace = pace; battle = battaglia; army = esercito; kingdom = regno; crown = corona; throne = trono
dragon = drago; dragons = draghi; ghost = fantasma; spirit = spirito; spirits = spiriti
creature = creatura; creatures = creature; beast = bestia; beasts = bestie; undead = non morto
orc = orco; orcs = orchi; dwarf = nano; dwarves = nani; elf = elfo; elves = elfi; human = umano; humans = umani
magic = magia; power = potere; strength = forza; shadow = ombra; shadows = ombre; darkness = oscurità
death = morte; life = vita; flame = fiamma; flames = fiamme; ice = ghiaccio; snow = neve; rain = pioggia; wind = vento
stone = pietra; stones = pietre; earth = terra; sky = cielo; sun = sole; moon = luna; star = stella; ash = cenere
leather = cuoio; cloth = stoffa; pelt = pelle; pelts = pelli; fur = pelliccia
egg = uovo; eggs = uova; milk = latte; apple = mela; flower = fiore; flowers = fiori
herb = erba; herbs = erbe; wheat = grano; potion = pozione
message = messaggio; news = notizie; task = compito; quest = missione; mission = missione; reward = ricompensa
money = denaro; coin = moneta; coins = monete; weapon = arma; weapons = armi; armor = armatura
supplies = provviste; ore = minerale; iron = ferro; cloak = mantello; bandits = banditi
twenty = venti; hundred = cento; thousand = mille
farewell = addio; indeed = davvero; quiet = silenzioso; together = insieme
near = vicino; far = lontano; inside = dentro; outside = fuori; behind = dietro; under = sotto; against = contro; between = tra

-- tier 5: phrases
thank you = grazie mille; good luck = buona fortuna; of course = certo; i don't know = non lo so
be careful = stai attento; come back = torna; right now = subito
good day = buona giornata; good morning = buongiorno; good evening = buonasera
well done = ben fatto; too late = troppo tardi; excuse me = mi scusi; at once = immediatamente
there is = c'è; there are = ci sono; each other = l'un l'altro; long ago = tanto tempo fa
i am = io sono; i'm = io sono; you are = tu sei; you're = tu sei; it is = è; it's = è
safe travels = buon viaggio; what do you want = cosa vuoi
how can i help you = come posso aiutarti; how may i help you = come posso aiutarla
]])
