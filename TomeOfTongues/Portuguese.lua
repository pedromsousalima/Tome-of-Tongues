-- Tome of Tongues - Portuguese.lua
-- One "english = portuguese" per entry (entries separated by ";" or new lines).
-- The English side must match a word from Swedish.lua, which sets its tier
-- and the extra accepted answers. Verbs are in the infinitive.
-- Words are kept understandable in both Portugal and Brazil where possible.
-- Corrections from native speakers are very welcome!

local _, ns = ...

ns.AddLanguage("pt", "Portuguese", "Português", [[
-- tier 1: basics
and = e; or = ou; but = mas; yes = sim; no = não
i = eu; you = você; he = ele; she = ela; we = nós; they = eles; it = isso; my = meu; your = seu
is = é; are = são; am = sou; was = era; were = eram; not = não
here = aqui; there = ali; now = agora
good = bom; bad = mau; big = grande; large = grande; small = pequeno; little = pequeno
man = homem; woman = mulher; friend = amigo; enemy = inimigo; day = dia; night = noite
water = água; fire = fogo; food = comida; dog = cão; cat = gato; wolf = lobo; bear = urso; king = rei
gold = ouro; help = ajuda; hello = olá; greetings = saudações
with = com; from = de; in = em; on = sobre
what = o quê; who = quem; where = onde; when = quando; why = porquê; how = como
one = um; two = dois; three = três

-- tier 2: common nouns & verbs
me = mim; him = ele; her = ela; us = nós; them = eles; our = nosso; their = deles; his = dele
for = para; of = de; have = ter; has = tem; had = tinha
can = poder; will = vai; must = dever; want = querer; need = precisar; know = saber; think = pensar
go = ir; come = vir; take = pegar; give = dar; get = obter
kill = matar; slay = abater; find = encontrar; see = ver; speak = falar; talk = conversar
return = voltar; bring = trazer; make = fazer; look = olhar; wait = esperar; eat = comer; drink = beber
man's = do homem; men = homens; women = mulheres; child = criança; children = crianças
friends = amigos; enemies = inimigos; days = dias; time = tempo; year = ano; years = anos; world = mundo
home = lar; house = casa; town = vila; city = cidade; village = aldeia; road = estrada; path = trilha
forest = floresta; woods = bosque; tree = árvore; trees = árvores; mountain = montanha; mountains = montanhas
river = rio; lake = lago; sea = mar
head = cabeça; eye = olho; eyes = olhos; heart = coração; blood = sangue; bone = osso; bones = ossos
meat = carne; fish = peixe; bread = pão
horse = cavalo; wolves = lobos; bears = ursos; spider = aranha; spiders = aranhas; bird = pássaro
boar = javali; boars = javalis
sword = espada; shield = escudo; axe = machado; queen = rainha; guard = guarda; guards = guardas
soldier = soldado; soldiers = soldados; people = gente
four = quatro; five = cinco; six = seis; seven = sete; eight = oito; nine = nove; ten = dez
thanks = obrigado; please = por favor; sorry = desculpa; welcome = bem-vindo; goodbye = adeus

-- tier 3: adjectives, adverbs, more verbs
very = muito; much = muito; many = muitos; few = poucos; all = todos; every = cada; each = cada
some = alguns; other = outro; more = mais; also = também; again = de novo
always = sempre; never = nunca; soon = em breve; still = ainda; already = já
perhaps = talvez; maybe = talvez; only = só; just = apenas; today = hoje; tomorrow = amanhã
without = sem; these = estes; something = algo; nothing = nada; everything = tudo; someone = alguém; everyone = todos
long = longo; short = curto; strong = forte; weak = fraco; fast = rápido; quick = ligeiro; quickly = rapidamente; slow = lento
dark = escuro; light = claro; cold = frio; warm = morno; hot = quente; young = jovem; old = velho; new = novo
beautiful = bonito; evil = maligno; brave = corajoso; poor = pobre; rich = rico; dangerous = perigoso
safe = seguro; sure = certo; true = verdadeiro; wrong = errado; easy = fácil; hard = duro; difficult = difícil
free = livre; empty = vazio; strange = estranho; important = importante; ready = pronto
tired = cansado; angry = zangado; happy = feliz; sad = triste; hungry = faminto; dead = morto; alive = vivo
red = vermelho; blue = azul; green = verde; black = preto; white = branco; first = primeiro; last = último
north = norte; south = sul; east = leste; west = oeste
say = dizer; said = disse; tell = contar; ask = perguntar; hear = ouvir; believe = acreditar
remember = lembrar; forget = esquecer; learn = aprender; buy = comprar; sell = vender; pay = pagar
open = abrir; begin = começar; start = iniciar; collect = coletar; gather = reunir
protect = proteger; defend = defender; save = salvar; rescue = resgatar; destroy = destruir
attack = atacar; fight = lutar; travel = viajar; send = enviar; search = procurar; seek = buscar
run = correr; sleep = dormir; die = morrer; love = amar; hate = odiar; deliver = entregar; use = usar

-- tier 4: Azeroth vocabulary
adventurer = aventureiro; stranger = forasteiro; hero = herói; champion = campeão; master = mestre; lord = senhor
priest = sacerdote; mage = mago; warrior = guerreiro; hunter = caçador; thief = ladrão; thieves = ladrões; farmer = agricultor
brother = irmão; sister = irmã; father = pai; mother = mãe; daughter = filha; family = família
door = porta; key = chave; box = caixa; crate = caixote; book = livro; letter = carta; map = mapa
ship = navio; boat = barco; bridge = ponte; tower = torre; castle = castelo; church = igreja
farm = fazenda; field = campo; fields = campos; cave = caverna; camp = acampamento
war = guerra; peace = paz; battle = batalha; army = exército; kingdom = reino; crown = coroa; throne = trono
dragon = dragão; dragons = dragões; ghost = fantasma; spirit = espírito; spirits = espíritos
creature = criatura; creatures = criaturas; beast = fera; beasts = feras; undead = morto-vivo
dwarf = anão; dwarves = anões; elf = elfo; elves = elfos; human = humano; humans = humanos
magic = magia; power = poder; strength = força; shadow = sombra; shadows = sombras; darkness = escuridão
death = morte; life = vida; flame = chama; flames = chamas; ice = gelo; snow = neve; rain = chuva; wind = vento
stone = pedra; stones = pedras; earth = terra; sky = céu; sun = sol; moon = lua; star = estrela; ash = cinza
leather = couro; cloth = tecido; pelt = pele; pelts = peles; fur = pelo
egg = ovo; eggs = ovos; milk = leite; apple = maçã; flower = flor; flowers = flores
herb = erva; herbs = ervas; wheat = trigo; potion = poção
message = mensagem; news = notícias; task = tarefa; quest = missão; mission = missão; reward = recompensa
money = dinheiro; coin = moeda; coins = moedas; weapon = arma; weapons = armas; armor = armadura
supplies = suprimentos; ore = minério; iron = ferro; cloak = capa; bandits = bandidos
twenty = vinte; hundred = cem; thousand = mil
farewell = adeus; indeed = de facto; quiet = quieto; together = juntos
near = perto; far = longe; inside = dentro; outside = fora; behind = atrás; under = debaixo; against = contra; between = entre

-- tier 5: phrases
thank you = muito obrigado; good luck = boa sorte; of course = claro; i don't know = não sei
be careful = tenha cuidado; come back = volte; right now = agora mesmo
good day = bom dia; good morning = bom dia; good evening = boa noite
well done = muito bem; too late = tarde demais; excuse me = com licença; at once = imediatamente
there is = há; there are = há; each other = um ao outro; long ago = há muito tempo
i am = eu sou; i'm = eu sou; you are = você é; you're = você é; it is = é; it's = é
safe travels = boa viagem; what do you want = o que você quer
how can i help you = como posso ajudar; how may i help you = como posso ajudá-lo
]])
