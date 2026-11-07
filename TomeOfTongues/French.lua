-- Tome of Tongues - French.lua
-- One "english = french" per entry (entries separated by ";" or new lines).
-- The English side must match a word from Swedish.lua, which sets its tier
-- and the extra accepted answers. Verbs are in the infinitive.
-- Corrections from native speakers are very welcome!

local _, ns = ...

ns.AddLanguage("fr", "French", "Français", [[
-- tier 1: basics
and = et; or = ou; but = mais; yes = oui; no = non
i = je; you = tu; he = il; she = elle; we = nous; they = ils; it = ça; my = mon; your = ton
is = est; are = sont; am = suis; was = était; were = étaient; not = pas
here = ici; there = là; now = maintenant
good = bon; bad = mauvais; big = grand; large = grand; small = petit; little = petit
man = homme; woman = femme; friend = ami; enemy = ennemi; day = jour; night = nuit
water = eau; fire = feu; food = nourriture; dog = chien; cat = chat; wolf = loup; bear = ours; king = roi
gold = or; help = aide; hello = bonjour; greetings = salutations
with = avec; from = de; in = dans; on = sur
what = quoi; who = qui; where = où; when = quand; why = pourquoi; how = comment
one = un; two = deux; three = trois

-- tier 2: common nouns & verbs
me = moi; him = lui; her = elle; us = nous; them = eux; our = notre; their = leur; his = son
for = pour; of = de; have = avoir; has = a; had = avait
can = pouvoir; will = va; must = devoir; want = vouloir; need = avoir besoin; know = savoir; think = penser
go = aller; come = venir; take = prendre; give = donner; get = obtenir
kill = tuer; slay = abattre; find = trouver; see = voir; speak = parler; talk = discuter
return = revenir; bring = apporter; make = faire; look = regarder; wait = attendre; eat = manger; drink = boire
man's = de l'homme; men = hommes; women = femmes; child = enfant; children = enfants
friends = amis; enemies = ennemis; days = jours; time = temps; year = an; years = ans; world = monde
home = foyer; house = maison; town = ville; city = cité; road = route; path = sentier
forest = forêt; woods = bois; tree = arbre; trees = arbres; mountain = montagne; mountains = montagnes
river = rivière; lake = lac; sea = mer
head = tête; eye = œil; eyes = yeux; heart = cœur; blood = sang; bone = os; bones = os
meat = viande; fish = poisson; bread = pain
horse = cheval; wolves = loups; bears = ours; spider = araignée; spiders = araignées; bird = oiseau
boar = sanglier; boars = sangliers
sword = épée; shield = bouclier; axe = hache; queen = reine; guard = garde; guards = gardes
soldier = soldat; soldiers = soldats; people = gens
four = quatre; five = cinq; seven = sept; eight = huit; nine = neuf; ten = dix
thanks = merci; please = s'il vous plaît; sorry = désolé; welcome = bienvenue; goodbye = au revoir

-- tier 3: adjectives, adverbs, more verbs
very = très; much = beaucoup; many = nombreux; few = peu; all = tous; every = chaque; each = chacun
some = quelques; other = autre; more = plus; also = aussi; again = encore
always = toujours; never = jamais; soon = bientôt; still = toujours; already = déjà
perhaps = peut-être; maybe = peut-être; only = seulement; just = juste; today = aujourd'hui; tomorrow = demain
without = sans; these = ces; something = quelque chose; nothing = rien; everything = tout
someone = quelqu'un; everyone = tout le monde
short = court; strong = fort; weak = faible; fast = rapide; quick = vif; quickly = vite; slow = lent
dark = sombre; light = clair; cold = froid; warm = chaud; hot = brûlant; young = jeune; old = vieux; new = nouveau
beautiful = beau; evil = maléfique; brave = courageux; poor = pauvre; rich = riche; dangerous = dangereux
safe = en sécurité; sure = sûr; true = vrai; wrong = faux; easy = facile; hard = dur; difficult = difficile
free = libre; empty = vide; strange = étrange; ready = prêt
tired = fatigué; angry = en colère; happy = heureux; sad = triste; hungry = affamé; dead = mort; alive = vivant
red = rouge; blue = bleu; green = vert; black = noir; white = blanc; first = premier; last = dernier
north = nord; south = sud; east = est; west = ouest
say = dire; said = dit; tell = raconter; ask = demander; hear = entendre; believe = croire
remember = se souvenir; forget = oublier; learn = apprendre; buy = acheter; sell = vendre; pay = payer
open = ouvrir; begin = commencer; start = démarrer; collect = collecter; gather = rassembler
protect = protéger; defend = défendre; save = sauver; rescue = secourir; destroy = détruire
attack = attaquer; fight = combattre; travel = voyager; send = envoyer; search = chercher; seek = rechercher
run = courir; sleep = dormir; die = mourir; love = aimer; hate = haïr; deliver = livrer; use = utiliser

-- tier 4: Azeroth vocabulary
adventurer = aventurier; stranger = étranger; hero = héros; master = maître; lord = seigneur
priest = prêtre; warrior = guerrier; hunter = chasseur; thief = voleur; thieves = voleurs; farmer = fermier
brother = frère; sister = sœur; father = père; mother = mère; daughter = fille; family = famille
door = porte; key = clé; box = boîte; crate = caisse; book = livre; letter = lettre; map = carte
ship = navire; boat = bateau; bridge = pont; tower = tour; castle = château; church = église
farm = ferme; field = champ; fields = champs; cave = grotte
war = guerre; peace = paix; battle = bataille; army = armée; kingdom = royaume; crown = couronne; throne = trône
ghost = fantôme; spirit = esprit; spirits = esprits
creature = créature; creatures = créatures; beast = bête; beasts = bêtes; undead = mort-vivant
dwarf = nain; dwarves = nains; elf = elfe; elves = elfes; human = humain; humans = humains
magic = magie; power = pouvoir; strength = force; shadow = ombre; shadows = ombres; darkness = ténèbres
death = mort; life = vie; flame = flamme; flames = flammes; ice = glace; snow = neige; rain = pluie; wind = vent
stone = pierre; stones = pierres; earth = terre; sky = ciel; sun = soleil; moon = lune; star = étoile; ash = cendre
leather = cuir; cloth = tissu; pelt = peau; pelts = peaux; fur = fourrure
egg = œuf; eggs = œufs; milk = lait; apple = pomme; flower = fleur; flowers = fleurs
herb = herbe; herbs = herbes; wheat = blé
news = nouvelles; task = tâche; quest = quête; reward = récompense
money = argent; coin = pièce; coins = pièces; weapon = arme; weapons = armes; armor = armure
supplies = provisions; ore = minerai; iron = fer; cloak = cape
twenty = vingt; hundred = cent; thousand = mille
farewell = adieu; indeed = en effet; quiet = calme; together = ensemble
near = près; far = loin; inside = dedans; outside = dehors; behind = derrière; under = sous; against = contre; between = entre

-- tier 5: phrases
thank you = merci beaucoup; good luck = bonne chance; of course = bien sûr; i don't know = je ne sais pas
be careful = fais attention; come back = reviens; right now = tout de suite
good day = bonne journée; good morning = bonjour; good evening = bonsoir
well done = bien joué; too late = trop tard; excuse me = excusez-moi; at once = immédiatement
there is = il y a; there are = il y a; each other = l'un l'autre; long ago = il y a longtemps
i am = je suis; i'm = je suis; you are = tu es; you're = tu es; it is = c'est; it's = c'est
safe travels = bon voyage; what do you want = que veux-tu
how can i help you = comment puis-je t'aider; how may i help you = comment puis-je vous aider
]])
