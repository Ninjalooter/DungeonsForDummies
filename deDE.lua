-- German Umlaute
-- ==============
-- ae = \195\164
-- ue = \195\188
-- oe = \195\182
-- ss = \195\159

-- Schlachtzugsymbole
-- ==================
-- {rt1} = Stern
-- {rt2} = Kreis
-- {rt3} = Diamant
-- {rt4} = Dreieck
-- {rt5} = Mond
-- {rt6} = Quadrat
-- {rt7} = Kreuz
-- {rt8} = Totensch\195\164del
--

-- Makros
-- ======
-- SPELL(<id>)
-- ACHIEVEMENT(<id>)
-- ITEM(<id>)

function NL_GetLocale_deDE()
	local YELLOW = "|cFFFFD700";
	local RESET = "|r";
	
	-- Text Labels
	local L = {};
	L['WELCOME'] = {
		'Viel Spa\195\159 mit dem Ninjalooter Addon Dungeons for Dummies!',
		"Besucht uns auf " .. YELLOW .. "http://www.ninjalooter.de" .. RESET,
		"Benutzt " .. YELLOW .. "/dungeonsfordummies" .. RESET .. " oder " .. YELLOW .. "/dfd" .. RESET .. " um den Guide jederzeit zu \195\182ffnen."
	};
	
	local BOSS_NAMES = {
			-- Testsubjekt [2955] = "Ebenenschreiter",
			-- Zul'Aman
			[23574] = "Akil'zon",
			[23576] = "Nalorakk",
			[23578] = "Jan'alai",
			[23577] = "Halazzi",
			[24239] = "Hexlord Malacrass",
			[23863] = "Daakara",
			-- Zul'Gurub
			[52155] = "Hohepriester Venoxis",
			[52151] = "Blutf\195\188rst Mandokir",
			[52286] = "Wushoolay",
			[52269] = "Renataki",
			[52258] = "Gri'lek",
			[52271] = "Hazza'rah",
			[52059] = "Hohepriesterin Kilnara",
			[52053] = "Zanzil",
			[52148] = "Jin'do",
	};

	local BOSSES_MENU_STRUCTURE = {
		-- Testsubjekt ["Mulgore"] = {2955},
		["Zul'Aman"] = {
			23574,
			23576,
			23578,
			23577,
			24239,
			23863
		},
		["Zul'Gurub"] = {
			52155,
			52151,
			["Hort des Wahnsinns"] = {
				52286, 
				52269,
				52258,
				52271
			},
			52059,
			52053,
			52148
		},
	};


	local bosses_taktik = {
		[2955] = {"Zeile  TEST", "Zeile 2 ITEM(3300)", "Zeile 3 ACHIEVEMENT(507)"}, -- Ebenenschreiter (Mulgore)

		-- Zul'Aman
		[23574] = { -- Akil'zon (Zul'Aman)
			"{rt1}Phase 1: Verteilt stehen, damit SPELL(97298) nicht an mehreren Spielern Schaden verursacht.",
			"Taucht ein wei\195\159er Adler auf, greift ihn sofort an, da der entf\195\188hrte Spieler ansonsten an SPELL(97318) stirbt.",
			"TIPP: Auch in den F\195\164ngen des Adlers k\195\182nnt ihr Schaden an ihm machen sowie euch und eure Gruppe heilen.",
			"{rt3}Phase 2: Der von SPELL(43648) betroffene Spieler wird in die Luft katapultiert. Stellt euch sofort unter ihn, in das Auge des Sturms, um dem Gewitter zu entgehen. Steht ihr zu weit weg, sterbt ihr."
		},
		[23576] = { -- Nalorakk (Zul'Aman)
			"{rt1}Phase 1: Der am weitesten vom Boss entfernte Spieler wird angest\195\188rmt und erh\195\164lt den Debuff SPELL(42402).",
			"Habt ihr den Debuff, lauft sofort in Nahkampfreichweite Richtung Tank, um nicht ein zweites Mal getroffen zu werden.",
			"Achtet darauf, dass alle Spieler ohne Debuff vom Boss entfernt stehen und Spieler mit Debuff beim Tank bleiben.",
			"{rt3}Phase 2: Der Boss verteilt Blutungen, SPELL(97810), SPELL(97811), die vom Heiler gegengeheilt werden m\195\188ssen.",
			"Durch SPELL(42398) werdet ihr regelm\195\164\195\159ig 2 Sekunden vom Zaubern unterbrochen. Versucht also HoTs auf dem Tank aufrecht zu erhalten.",
		},
		
		[23578] = {  -- Jan'alai (Zul'Aman)
			"{rt1}Phase 1: Weicht dem SPELL(97497) und den daraus folgenden Lavapf\195\188tzen aus - auch der Tank!",
			"Nietet einen der Brutw\195\164chter um und lasst den anderen die Welpen schl\195\188pfen.",
			"Der Tank krallt sich alle geschl\195\188pften Welpen und die DDs bomben sie weg.",
			"{rt3}Phase 2: Der Boss teleportiert sich in die Mitte des Altars und verteilt SPELL(42630) auf der gesamten Plattform. Sucht euch eine L\195\188cke, bleibt dort stehen und wartet bis die Kugeln explodieren.",
			"{rt4}Phase 3: Bei 35% schl\195\188pfen alle noch \195\188brigen Welpen.",
			"Bei 25% ger\195\164t der Boss in SPELL(44779). Z\195\188ndet in dieser Phase Heldentum/ Kampfrausch/ Zeitkr\195\188mmung.",
		},
		
		[23577] = { -- Halazzi (Zul'Aman)
			"{rt1}Phase 1: Sobald ein SPELL(97500) auftaucht, zieht der Tank den Boss sofort aus dem gr\195\188nem Heilkreis heraus. Fernk\195\164mpfer stellen sich jedoch hinein, um Mana und TP zu regenerieren.",
			"Lasst die Finger von den Wassertotems! Zerst\195\182rt sie unter keinen Umst\195\164nden.",
			"{rt3}Phase 2: Konzentriert euch auf den Troll, da der Luchs nicht tankbar ist. Den ausgeteilten Schaden vom Luchs kompensiert ihr durch das Nutzen der noch aus P1 \195\188brig gebliebenen Heilkreise.",
			"Zerst\195\182rt sofort alle SPELL(97492) und entfernt SPELL(97490) von betroffenen Spielern.",
			"{rt4}Phase 3: Ab 25% nutzt Halazzi all seine F\195\164higkeiten aus P1 und P2 auf einen Schlag. Z\195\188ndet hier Spezialf\195\164higkeiten sowie Heldentum/ Kampfrausch/ Zeitkr\195\188mmung.", 
		},
		
		[24239] = { -- Hexlord Malacrass (Zul'Aman)
			"Setzt Malacrass' Gef\195\164hrten mit Kontrollf\195\164higkeiten (Schafen, Verhexen, etc.) au\195\159er Gefecht. Stehen euch keine zur Verf\195\188gung, m\195\188sst ihr die Begleiter t\195\182ten, bevor ihr auf den Boss geht.",
			"Malacrass beschie\195\159t euch alle 30 Sek. mit SPELL(43383) und verringert mit SPELL(44131) euren ausgeteilten Schaden um 1%. Im Gegenzug wird seiner um 1% erh\195\182ht.",
			"Danach entzieht der Boss einem zuf\195\164llig ausgew\195\164hltem Spieler seine Seele. Je nach Klasse des Spielers, hat er nun neue F\195\164higkeiten auf Lager.",
			"WICHTIG: Unterbrechen! Oberste Priorit\195\164t haben alle Heilzauber, danach die Schadensf\195\164higkeiten.",
		},
		[23863] = {  -- Daakara (Zul'Aman)
			"{rt1}Phase 1: Heilt den von SPELL(97639) betroffenen Spieler voll, damit die Blutung verschwindet.",
			"{rt3} Phase 2 und 3: Jeweils eines von folgenden Tieravataren:",
			"B\195\164r: Der vom Boss am weitesten entfernt stehende Spieler erh\195\164lt den Debuff SPELL(42402) und l\195\164uft danach sofort in Nahkampfreichweite, um nicht ein zweites Mal getroffen zu werden. Wechselt euch mit dem Kassieren des Debuffs ab.",
			"Adler: Geht den Wirbelst\195\188rmen aus dem Weg und zerst\195\182rt das Blitzschlagtotem.",
			"Drachenfalke: Weicht dem Flammenatem und den Lavakreisen aus.",
			"Luchs: T\195\182tet zuerst die kleinen Luchse, um den eintreffenden Schaden zu vermindern. Schnappt euch danach Daakara. Z\195\188ndet schadensreduzierende F\195\164higkeiten, solltet ihr von der Blutung betroffen sein.",
		},
		
		-- Zul'Gurub
		[52155] = { -- Hohepriester Venoxis (Zul'Gurub)
			"{rt1}Phase 1: Geht der gr\195\188nen Giftspur SPELL(97338) aus dem Weg. INFO: Sie verl\195\164uft immer nach dem selben Muster. Sucht euch also im Voraus schon feste Pl\195\164tze.",
			"Seid ihr durch SPELL(96475) mit einem anderen Spieler verbunden, lauft so weit voneinander weg, bis die Verbindung bricht. ACHTUNG: Bei der Aufl\195\182sung der Verbindung entsteht eine Explosion.",
			"{rt3}Phase 2: Weicht dem kegelf\195\182rmig vor dem Boss entstehendem SPELL(96509) aus, umgeht die Giftpf\195\188tzen und geht den durch SPELL(97104) herbeigerufenen Ranken aus dem Weg, auch der Tank!",
			"Ist SPELL(97104) abgelaufen, leidet Venoxis unter SPELL(96653). Z\195\188ndet hier all eure Cooldowns.", 
		},
		[52151] = { -- Blutf\195\188rst Mandokir (Zul'Gurub)
			"Weicht fr\195\188hzeitig Mandokirs SPELL(96740) aus. Die Attacke k\195\188ndigt sich durch r\195\182tlichen Staub am Boden an.",
			"Wird der Raptor freigelassen, muss er so schnell wie m\195\182glich sterben. Tut er es nicht, t\195\182tet er die Geister. TIPP: Nutzt Verlangsamungseffekte!",	
			"Das SPELL(96684) trifft immer einen zuf\195\164llig ausgew\195\164hlten Spieler und t\195\182tet diesen umgehend. Ihr k\195\182nnt die F\195\164higkeit nicht unterbrechen, hinausz\195\182gern oder aufhalten.",
			"Seid ihr tot, opfert sich ein Geist f\195\188r euch auf und belebt euch wieder. Da euch nur 8 Geister, sprich 8 Wiederbelebungen, zur Verf\195\188gung stehen, muss der Boss sp\195\164testens nach dem Aufbrauchen aller Geister sterben.",
			"ACHTUNG Heiler: Versucht nur den Tank zu heilen. Die TP der DDs lasst ihr so gut es geht au\195\159er Acht, damit sich der Boss durch SPELL(96776) nicht zu stark hochheilt.", 
		},

		[52286] = { -- Wushoolay Hort des Wahnsinns (Zul'Gurub)
			"Stellt euch mit Abstand zueinander auf, um SPELL(96713) zu entgehen und geht aus der \195\188ber euch schwebenden SPELL(96711) heraus.",
			"In regelm\195\164\195\159igen Abst\195\164nden verwandelt sich Wushoolay in eine Blitzkugel und st\195\188rmt einen zuf\195\164llig ausgew\195\164hlten Spieler an.",
			"Rennt sofort vom Einschlagsort weg, damit ihr nicht von der direkt danach folgenden F\195\164higkeit SPELL(96699) umgenietet werdet.", 
		},
		[52269] = { -- Renataki Hort des Wahnsinns (Zul'Gurub)
			"Weicht Renatakis SPELL(96646) aus, um nicht unn\195\182tig Schaden und die fiese Blutung SPELL(96644) zu kassieren.",
			"ACHTUNG Heiler: Der Boss stiehlt regelm\195\164\195\159ig einem Spieler 90% seiner Lebenspunkte. Heilt ihn schnell wieder hoch, um Opfer zu vermeiden.", 
		},
		[52258] = { -- Gri'lek Hort des Wahnsinns (Zul'Gurub)
			"Werdet Ihr von Gri'lek verfolgt (blauer Pfeil auf eurem Kopf und un\195\188bersehbare Nachricht in der Mitte eures Bildschirms), m\195\188sst ihr sofort von dem Boss weglaufen und euch in Sicherheit bringen.",
			"Weicht au\195\159erdem dem Erdbeben aus, dass sich durch aufgewirbeltem Staub am Boden fr\195\188hzeitig ank\195\188ndigt.",
		}, 

		[52271] = { -- Hazza'rah Hort des Wahnsinns (Zul'Gurub)
			"In regelm\195\164\195\159igen Abst\195\164nden ruft Hazza'rah mit Hilfe von SPELL(96658) vier geisterhafte Gegner herbei, die jeweils einen Spieler mit SPELL(96757) au\195\159er Gefecht setzen.",
			"Der nicht befallene Spieler muss sofort eines der Geister umnieten, um den dadurch festgesetzten Spieler zu befreien und ihn damit vorm Tod von SPELL(96758) zu bewahren.",
			"Befreit nach und nach eure gesamte Gruppe, um wieder Schaden am Boss zu machen.", 
		},
		[52059] = { -- Hohepriesterin Kilnara (Zul'Gurub)
			"{rt1}Phase 1: Unterbrecht so h\195\164ufig wie es geht SPELL(96956) und SPELL(96435).",
			"Habt ihr SPELL(96435) nicht unterbrochen, m\195\188sst ihr au\195\159er Nahkampfreichweite laufen, um keinen Schaden zu erleiden.",
			"Stellt euch stets hinter die lilane SPELL(96457), um nicht von ihr \195\188berrollt und get\195\182tet zu werden.",
			"TANK: Schnapp dir nach und nach eine der vier Panthergruppen und lass die DDs sie t\195\182ten.",
			"DDs: Hat der Tank eine Panthergruppe gepullt, m\195\188sst ihr diese sofort umnieten. Pr\195\188gelt Kilnaras TP erst auf 50% runter, sobald alle Panther tot sind.",
			"{rt3}Pjhase 2: Nutzt Cooldown-F\195\164higkeiten wie Heldentum/ Kampfrausch/ Zeitkr\195\188mmung.", 
		},

		[52053] = { -- Zanzil (Zul'Gurub)
			"Weicht dem auf dem Boden entlanglaufendem, lilanem Arkanstrahl SPELL(96914) aus.",
			"Befolgt die farblich in der Mitte eures Bildschirms auftauchende Nachricht:",
			"Gr\195\188n =  SPELL(96338) = JEDER klickt auf den gr\195\188nen Kessel, um sich den Buff SPELL(96328) abzuholen und damit die Phase lebend zu \195\188berstehen.",
			"Rot = SPELL(96319) = Der TANK klickt den roten Kessel an, um den Buff SPELL(96326) zu erhalten und damit die eingesammelten Zanzili Zombies zu vernichten.",
			"Blau = SPELL(96316) = EIN FERNKAEMPFER klickt auf den blauen Kessel, um den Buff SPELL(96325) zu bekommen und damit den herbeigerufenen Berserker einzufrieren.",
			"ALLE DDs helfen ihm den Beserker schnell zu vernichten bzw. ihn schnell wieder einzufrieren.",
		},

		[52148] = {-- Jin'do (Zul'Gurub)
			"{rt1}Phase 1: Der Tank zieht den Boss sofort aus der gr\195\188n leuchtenden SPELL(97170) heraus.",
			"Beginnt der Boss SPELL(97172) zu casten, begebt ihr euch ALLE sofort unter die gr\195\188ne Kuppel, auch der Tank!",
			"{rt3}Phase 2: Weicht den SPELL(97158) auf dem Altarboden aus und vernichet schnell die kleinen Geister.",
			"TANK: Ziehe einen Berserker-Geist links oder rechts der Treppe die Plattform hoch und tanke ihn.",
			"DDs: Lasst so lange die Finger vom Berserker, bis alle Schilde zerst\195\182rt wurden.",
			"Ist ein Pfeil auf eurem Kopf rennt ihr sofort zu einer geschildeten Kette, um sie zu sprengen. Erst danach k\195\182nnt ihr sie zerst\195\182ren.",
		},
	};
		
	local bosses_loot = {
		[2955] = {"ITEM(3300)"},
		-- Zul'Aman
		[23574] = {"ITEM(69549), ITEM(69550), ITEM(69551)",
				   "ITEM(69552), ITEM(69553)"},
		[23576] = {"ITEM(69554), ITEM(69555), ITEM(69556)",
				   "ITEM(69557), ITEM(69558)"},
		[23578] = {"ITEM(69559), ITEM(69560), ITEM(69561)",
				   "ITEM(69562), ITEM(69563)"},
		[23577] = {"ITEM(69564), ITEM(69565), ITEM(69566)",
				   "ITEM(69567), ITEM(69568)"},
		[24239] = {"ITEM(69569), ITEM(69570), ITEM(69571)",
				   "ITEM(69572), ITEM(69573)"},
		[23863] = {"ITEM(69574), ITEM(69575), ITEM(69576)",
				   "ITEM(69577), ITEM(69578), ITEM(69579)",
				   "ITEM(69580), ITEM(69581), ITEM(69582)",
				   "ITEM(69583)"},
		-- Zul'Gurub
		[52155] = {"ITEM(69600), ITEM(69601), ITEM(69602)",
				   "ITEM(69603), ITEM(69604)"},
		[52151] = {"ITEM(69605), ITEM(69606), ITEM(69607)",
				   "ITEM(69608), ITEM(69609), ITEM(68823)"},
		[52286] = {"ITEM(69641), ITEM(69640), ITEM(69631)",
				   "ITEM(69633), ITEM(69632), ITEM(69630)"},
		[52269] = {"ITEM(69639), ITEM(69638), ITEM(69632)",
				   "ITEM(69631), ITEM(69630), ITEM(69633)"},
		[52258] = {"ITEM(69634), ITEM(69635), ITEM(69630)",
				   "ITEM(69633), ITEM(69631), ITEM(69632)"},
		[52271] = {"ITEM(69637), ITEM(69636), ITEM(69630)",
				   "ITEM(69631), ITEM(69632), ITEM(69633)"},
		[52059] = {"ITEM(69610), ITEM(69611), ITEM(69612)",
				   "ITEM(69613), ITEM(69614), ITEM(68824)"},
		[52053] = {"ITEM(69615), ITEM(69616), ITEM(69617)",
				   "ITEM(69618), ITEM(69619)"},
		[52148] = {"ITEM(69620), ITEM(69621), ITEM(69622)",
				   "ITEM(69623), ITEM(69624), ITEM(69625)", 
				   "ITEM(69626), ITEM(69627), ITEM(69628)",
				   "ITEM(69629)"},
	};

	local bosses_achievements = {
		[2955] = {"ERFOLGE"},
		-- Zul'Aman
		[23574] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(5761)"},
		[23576] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(5761)"},
		[23578] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(5761)"},
		[23577] = {"ACHIEVEMENT(5750)"},
		[24239] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(5761)"},
		[23863] = {"ACHIEVEMENT(5760)"},
		-- Zul'Gurub
		[52155] = {"ACHIEVEMENT(5743)"},
		[52151] = {"ACHIEVEMENT(5762)"},
		[52286] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(5744)"},
		[52269] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(5744)"},
		[52258] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(5744)"},
		[52271] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(5744)"},
		[52059] = {"ACHIEVEMENT(5765)"},
		[52053] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(5744)"},
		[52148] = {"ACHIEVEMENT(5759)"},
	};
	
	return L, BOSS_NAMES, BOSSES_MENU_STRUCTURE, bosses_taktik, bosses_loot, bosses_achievements;
end