-- Tome of Tongues - Spanish.lua
-- One "english = spanish" per entry (entries separated by ";" or new lines).
-- The English side must match a word from Swedish.lua, which sets its tier
-- and the extra accepted answers. Verbs are in the infinitive.
-- Corrections from native speakers are very welcome!

local _, ns = ...

ns.AddLanguage("es", "Spanish", "Español", [[
-- tier 1: basics
and = y; or = o; but = pero; yes = sí
i = yo; you = tú; he = él; she = ella; we = nosotros; they = ellos; it = eso; my = mi; your = tu
is = es; are = son; am = soy; was = era; were = eran; not = no
here = aquí; there = allí; now = ahora
good = bueno; bad = malo; big = grande; large = grande; small = pequeño; little = pequeño
man = hombre; woman = mujer; friend = amigo; enemy = enemigo; day = día; night = noche
water = agua; fire = fuego; food = comida; dog = perro; cat = gato; wolf = lobo; bear = oso; king = rey
gold = oro; help = ayuda; hello = hola; greetings = saludos
with = con; from = de; in = en; on = sobre
what = qué; who = quién; where = dónde; when = cuándo; why = por qué; how = cómo
one = uno; two = dos; three = tres

-- tier 2: common nouns & verbs
me = mí; him = lo; her = ella; us = nosotros; them = ellos; our = nuestro; their = su; his = su
for = para; of = de; have = tener; has = tiene; had = tenía
can = poder; will = va a; must = deber; want = querer; need = necesitar; know = saber; think = pensar
go = ir; come = venir; take = tomar; give = dar; get = conseguir
kill = matar; slay = aniquilar; find = encontrar; see = ver; speak = hablar; talk = charlar
return = regresar; bring = traer; make = hacer; look = mirar; wait = esperar; eat = comer; drink = beber
man's = del hombre; men = hombres; women = mujeres; child = niño; children = niños
friends = amigos; enemies = enemigos; days = días; time = tiempo; year = año; years = años; world = mundo
home = hogar; house = casa; town = pueblo; city = ciudad; village = aldea; road = camino; path = sendero
forest = bosque; woods = arboleda; tree = árbol; trees = árboles; mountain = montaña; mountains = montañas
river = río; lake = lago; sea = mar
head = cabeza; eye = ojo; eyes = ojos; heart = corazón; blood = sangre; bone = hueso; bones = huesos
meat = carne; fish = pescado; bread = pan
horse = caballo; wolves = lobos; bears = osos; spider = araña; spiders = arañas; bird = pájaro
boar = jabalí; boars = jabalíes
sword = espada; shield = escudo; axe = hacha; queen = reina; guard = guardia; guards = guardias
soldier = soldado; soldiers = soldados; people = gente
four = cuatro; five = cinco; six = seis; seven = siete; eight = ocho; nine = nueve; ten = diez
thanks = gracias; please = por favor; sorry = lo siento; welcome = bienvenido; goodbye = adiós

-- tier 3: adjectives, adverbs, more verbs
very = muy; much = mucho; many = muchos; few = pocos; all = todos; every = cada; each = cada
some = algunos; other = otro; more = más; also = también; again = otra vez
always = siempre; never = nunca; soon = pronto; still = todavía; already = ya
perhaps = quizás; maybe = tal vez; only = solo; just = solamente; today = hoy; tomorrow = mañana
without = sin; these = estos; something = algo; nothing = nada; everything = todo; someone = alguien; everyone = todos
long = largo; short = corto; strong = fuerte; weak = débil; fast = rápido; quick = veloz; quickly = rápidamente; slow = lento
dark = oscuro; light = claro; cold = frío; warm = cálido; hot = caliente; young = joven; old = viejo; new = nuevo
beautiful = hermoso; evil = malvado; brave = valiente; poor = pobre; rich = rico; dangerous = peligroso
safe = seguro; sure = seguro; true = verdadero; wrong = equivocado; easy = fácil; hard = duro; difficult = difícil
free = libre; empty = vacío; strange = extraño; important = importante; ready = listo
tired = cansado; angry = enojado; happy = feliz; sad = triste; hungry = hambriento; dead = muerto; alive = vivo
red = rojo; blue = azul; green = verde; black = negro; white = blanco; first = primero; last = último
north = norte; south = sur; east = este; west = oeste
say = decir; said = dijo; tell = contar; ask = preguntar; hear = oír; believe = creer
remember = recordar; forget = olvidar; learn = aprender; buy = comprar; sell = vender; pay = pagar
open = abrir; begin = comenzar; start = empezar; collect = recoger; gather = reunir
protect = proteger; defend = defender; save = salvar; rescue = rescatar; destroy = destruir
attack = atacar; fight = luchar; travel = viajar; send = enviar; search = buscar; seek = buscar
run = correr; sleep = dormir; die = morir; love = amar; hate = odiar; deliver = entregar; use = usar

-- tier 4: Azeroth vocabulary
adventurer = aventurero; stranger = forastero; hero = héroe; champion = campeón; master = maestro; lord = señor
priest = sacerdote; mage = mago; warrior = guerrero; hunter = cazador; thief = ladrón; thieves = ladrones; farmer = granjero
brother = hermano; sister = hermana; father = padre; mother = madre; daughter = hija; family = familia
door = puerta; key = llave; box = caja; crate = cajón; book = libro; letter = carta; map = mapa
ship = barco; boat = bote; bridge = puente; tower = torre; castle = castillo; church = iglesia
farm = granja; field = campo; fields = campos; cave = cueva; camp = campamento
war = guerra; peace = paz; battle = batalla; army = ejército; kingdom = reino; crown = corona; throne = trono
dragon = dragón; dragons = dragones; ghost = fantasma; spirit = espíritu; spirits = espíritus
creature = criatura; creatures = criaturas; beast = bestia; beasts = bestias; undead = no-muerto
orc = orco; orcs = orcos; dwarf = enano; dwarves = enanos; elf = elfo; elves = elfos; human = humano; humans = humanos
magic = magia; power = poder; strength = fuerza; shadow = sombra; shadows = sombras; darkness = oscuridad
death = muerte; life = vida; flame = llama; flames = llamas; ice = hielo; snow = nieve; rain = lluvia; wind = viento
stone = piedra; stones = piedras; earth = tierra; sky = cielo; sun = sol; moon = luna; star = estrella; ash = ceniza
leather = cuero; cloth = tela; pelt = piel; pelts = pieles; fur = pelaje
egg = huevo; eggs = huevos; milk = leche; apple = manzana; flower = flor; flowers = flores
herb = hierba; herbs = hierbas; wheat = trigo; potion = poción
message = mensaje; news = noticias; task = tarea; quest = misión; mission = misión; reward = recompensa
money = dinero; coin = moneda; coins = monedas; weapon = arma; weapons = armas; armor = armadura
supplies = suministros; ore = mineral; iron = hierro; cloak = capa; bandits = bandidos
twenty = veinte; hundred = cien; thousand = mil
farewell = adiós; indeed = en efecto; quiet = tranquilo; together = juntos
near = cerca; far = lejos; inside = dentro; outside = fuera; behind = detrás; under = debajo; against = contra; between = entre

-- tier 5: phrases
thank you = muchas gracias; good luck = buena suerte; of course = por supuesto; i don't know = no sé
be careful = ten cuidado; come back = vuelve; right now = ahora mismo
good day = buen día; good morning = buenos días; good evening = buenas tardes
well done = bien hecho; too late = demasiado tarde; excuse me = disculpe; at once = de inmediato
there is = hay; there are = hay; each other = el uno al otro; long ago = hace mucho tiempo
i am = yo soy; i'm = yo soy; you are = tú eres; you're = tú eres; it is = eso es; it's = eso es
safe travels = buen viaje; what do you want = qué quieres
how can i help you = cómo puedo ayudarte; how may i help you = cómo puedo ayudarle
]])
