-- Tome of Tongues - German.lua
-- One "english = german" per entry (entries separated by ";" or new lines).
-- The English side must match a word from Swedish.lua, which sets its tier
-- and the extra accepted answers. Verbs are in the infinitive.
-- Corrections from native speakers are very welcome!

local _, ns = ...

ns.AddLanguage("de", "German", "Deutsch", [[
-- tier 1: basics
and = und; or = oder; but = aber; yes = ja; no = nein
i = ich; you = du; he = er; she = sie; we = wir; they = sie; it = es; my = mein; your = dein
is = ist; are = sind; am = bin; was = war; were = waren; not = nicht
here = hier; there = dort; now = jetzt
good = gut; bad = schlecht; big = groß; large = groß; small = klein; little = klein
man = Mann; woman = Frau; friend = Freund; enemy = Feind; day = Tag; night = Nacht
water = Wasser; fire = Feuer; food = Essen; dog = Hund; cat = Katze; bear = Bär; king = König
help = Hilfe; hello = hallo; greetings = Grüße
with = mit; from = von; on = auf
what = was; who = wer; where = wo; when = wann; why = warum; how = wie
one = eins; two = zwei; three = drei

-- tier 2: common nouns & verbs
me = mich; him = ihn; her = sie; us = uns; them = sie; our = unser; their = ihr; his = sein
for = für; of = von; have = haben; has = hat; had = hatte
can = können; will = werden; must = müssen; want = wollen; need = brauchen; know = wissen; think = denken
go = gehen; come = kommen; take = nehmen; give = geben; get = bekommen
kill = töten; slay = erschlagen; find = finden; see = sehen; speak = sprechen; talk = reden
return = zurückkehren; bring = bringen; make = machen; look = schauen; wait = warten; eat = essen; drink = trinken
man's = des Mannes; men = Männer; women = Frauen; child = Kind; children = Kinder
friends = Freunde; enemies = Feinde; days = Tage; time = Zeit; year = Jahr; years = Jahre; world = Welt
home = Zuhause; house = Haus; town = Stadt; city = Stadt; village = Dorf; road = Straße; path = Pfad
forest = Wald; woods = Wald; tree = Baum; trees = Bäume; mountain = Berg; mountains = Berge
river = Fluss; lake = See; sea = Meer
head = Kopf; eye = Auge; eyes = Augen; heart = Herz; blood = Blut; bone = Knochen; bones = Knochen
meat = Fleisch; fish = Fisch; bread = Brot
horse = Pferd; wolves = Wölfe; bears = Bären; spider = Spinne; spiders = Spinnen; bird = Vogel; boar = Eber; boars = Eber
sword = Schwert; shield = Schild; axe = Axt; queen = Königin; guard = Wache; guards = Wachen
soldier = Soldat; soldiers = Soldaten; people = Leute
four = vier; five = fünf; six = sechs; seven = sieben; eight = acht; nine = neun; ten = zehn
thanks = danke; please = bitte; sorry = Entschuldigung; welcome = willkommen; goodbye = auf Wiedersehen

-- tier 3: adjectives, adverbs, more verbs
very = sehr; much = viel; many = viele; few = wenige; all = alle; every = jeder; each = jeder
some = einige; other = andere; more = mehr; also = auch; again = wieder
always = immer; never = nie; soon = bald; still = noch; already = schon
perhaps = vielleicht; maybe = vielleicht; only = nur; just = nur; today = heute; tomorrow = morgen
without = ohne; these = diese; something = etwas; nothing = nichts; everything = alles; someone = jemand; everyone = alle
long = lang; short = kurz; strong = stark; weak = schwach; fast = schnell; quick = flink; quickly = schnell; slow = langsam
dark = dunkel; light = hell; cold = kalt; hot = heiß; young = jung; old = alt; new = neu
beautiful = schön; evil = böse; brave = mutig; poor = arm; rich = reich; dangerous = gefährlich
safe = sicher; sure = gewiss; true = wahr; wrong = falsch; easy = leicht; hard = schwer; difficult = schwierig
free = frei; empty = leer; strange = seltsam; important = wichtig; ready = bereit
tired = müde; angry = wütend; happy = glücklich; sad = traurig; hungry = hungrig; dead = tot; alive = lebendig
red = rot; blue = blau; green = grün; black = schwarz; white = weiß; first = erste; last = letzte
north = Norden; south = Süden; east = Osten; west = Westen
say = sagen; said = sagte; tell = erzählen; ask = fragen; hear = hören; believe = glauben
remember = erinnern; forget = vergessen; learn = lernen; buy = kaufen; sell = verkaufen; pay = bezahlen
open = öffnen; begin = beginnen; start = anfangen; collect = sammeln; gather = einsammeln
protect = schützen; defend = verteidigen; save = retten; rescue = befreien; destroy = zerstören
attack = angreifen; fight = kämpfen; travel = reisen; send = schicken; search = suchen; seek = aufsuchen
run = laufen; sleep = schlafen; die = sterben; love = lieben; hate = hassen; deliver = liefern; use = benutzen

-- tier 4: Azeroth vocabulary
adventurer = Abenteurer; stranger = Fremder; hero = Held; champion = Streiter; master = Meister; lord = Herr
priest = Priester; mage = Magier; warrior = Krieger; hunter = Jäger; thief = Dieb; thieves = Diebe; farmer = Bauer
brother = Bruder; sister = Schwester; father = Vater; mother = Mutter; daughter = Tochter; family = Familie
door = Tür; key = Schlüssel; box = Kiste; crate = Kasten; book = Buch; letter = Brief; map = Karte
ship = Schiff; boat = Boot; bridge = Brücke; tower = Turm; castle = Burg; church = Kirche
farm = Hof; field = Feld; fields = Felder; cave = Höhle; camp = Lager
war = Krieg; peace = Frieden; battle = Schlacht; army = Armee; kingdom = Königreich; crown = Krone; throne = Thron
dragon = Drache; dragons = Drachen; ghost = Gespenst; spirit = Geist; spirits = Geister
creature = Kreatur; creatures = Kreaturen; beast = Bestie; beasts = Bestien; undead = Untote
orc = Ork; orcs = Orks; dwarf = Zwerg; dwarves = Zwerge; elves = Elfen; human = Mensch; humans = Menschen
magic = Magie; power = Macht; strength = Stärke; shadow = Schatten; shadows = Schatten; darkness = Dunkelheit
death = Tod; life = Leben; flame = Flamme; flames = Flammen; ice = Eis; snow = Schnee; rain = Regen
stone = Stein; stones = Steine; earth = Erde; sky = Himmel; sun = Sonne; moon = Mond; star = Stern; ash = Asche
leather = Leder; cloth = Stoff; pelt = Fell; pelts = Felle; fur = Pelz
egg = Ei; eggs = Eier; milk = Milch; apple = Apfel; flower = Blume; flowers = Blumen
herb = Kraut; herbs = Kräuter; wheat = Weizen; potion = Trank
message = Nachricht; news = Neuigkeiten; task = Aufgabe; quest = Auftrag; mission = Mission; reward = Belohnung
money = Geld; coin = Münze; coins = Münzen; weapon = Waffe; weapons = Waffen; armor = Rüstung
supplies = Vorräte; ore = Erz; iron = Eisen; cloak = Umhang; bandits = Banditen
twenty = zwanzig; hundred = hundert; thousand = tausend
farewell = lebe wohl; indeed = in der Tat; quiet = still; together = zusammen
near = nahe; far = weit; inside = drinnen; outside = draußen; behind = hinter; under = unter; against = gegen; between = zwischen

-- tier 5: phrases
thank you = danke schön; good luck = viel Glück; of course = natürlich; i don't know = ich weiß nicht
be careful = sei vorsichtig; come back = komm zurück; right now = jetzt gleich
good day = guten Tag; good morning = guten Morgen; good evening = guten Abend
well done = gut gemacht; too late = zu spät; excuse me = entschuldigen Sie; at once = sofort
there is = es gibt; there are = es gibt; each other = einander; long ago = vor langer Zeit
i am = ich bin; i'm = ich bin; you are = du bist; you're = du bist; it is = es ist; it's = es ist
safe travels = gute Reise; what do you want = was willst du
how can i help you = wie kann ich dir helfen; how may i help you = wie kann ich Ihnen helfen
]])
