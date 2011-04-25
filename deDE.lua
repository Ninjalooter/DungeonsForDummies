-- ue = \195\188
-- oe = \195\182

-- Schlachtzugsymbole
-- {rt1} = Stern
-- {rt2} = Kreis
-- {rt3} = Diamant
-- {rt4} = Dreieck
-- {rt5} = Mond
-- {rt6} = Quadrat
-- {rt7} = Kreuz
-- {rt8} = Totenschädel
-- 

bosses_names = {
		[2955] = "Ebenenschreiter - Mulgore",
		-- Zul'Aman
		[23574] = "Akil'zon - Zul'Aman",
		[23576] = "Nalorakk - Zul'Aman",
		[23578] = "Jan'alai - Zul'Aman",
		[23577] = "Halazzi - Zul'Aman",
		[24239] = "Hexlord Malacrass - Zul'Aman",
		[23863] = "Daakara - Zul'Aman",
		-- Zul'Gurub
		[52155] = "Hohepriester Venoxis - Zul'Gurub",
		[52151] = "Blutfürst Mandokir - Zul'Gurub",
		[52286] = "Wushoolay Hort des Wahnsinns - Zul'Gurub",
		[52269] = "Renataki Hort des Wahnsinns - Zul'Gurub",
		[52258] = "Gri'lek Hort des Wahnsinns - Zul'Gurub",
		[52271] = "Hazza'rah Hort des Wahnsinns - Zul'Gurub",
		[52059] = "Hohepriesterin Kilnara - Zul'Gurub",
		[52053] = "Zanzil - Zul'Gurub",
		[52148] = "Jin'do - Zul'Gurub",
};


bosses_taktik = {

	[2955] = { "Zeile 1", "Zeile 2 ITEM(63274)", "Zeile 3 ACHIEVEMENT(507)", "Zeile 4 {Kreuz} SPELL(75331)"}, -- Ebenenschreiter (Mulgore)

	-- Zul'Aman
	[23574] = { -- Akil'zon (Zul'Aman)
		"{rt1}Phase 1: Verteilt stehen, damit SPELL(43661) nicht an mehreren Spielern Schaden verursacht.",
		"Taucht ein weißer Adler auf, muss er sofort von allen DDs angegriffen werden, da der entführte Spieler ansonsten an SPELL(97318) stirbt.",
		"{rt3}Phase 2: Der von SPELL(43648) betroffene Spieler wird in die Luft katapultiert. Stellt euch sofort unter ihn, in das Auge des Sturms, um dem Gewitter zu entgehen. Steht ihr zu weit weg, sterbt ihr."
	},
	[23576] = { -- Nalorakk (Zul'Aman)
		"{rt1}Phase 1: Der am weitesten vom Boss entfernte Spieler wird angestürmt und erhält den Debuff SPELL(42402).",
		"Habt ihr den Debuff kassiert, lauft ihr sofort in Nahkampfreichweite Richtung Tank, um nicht ein zweites Mal getroffen zu werden.",
		"Achtet darauf, dass immer Spieler ohne Debuff vom Boss entfernt stehen und sich Spieler mit Debuff beim Tank positionieren.",
		"{rt3}Phase 2: Der Boss verteilt Blutungen, SPELL(42397), SPELL(42395), die vom Heiler gegenheilt werden müssen.",
		"Durch SPELL(42398) werdet ihr regelmäßig 2 Sekunden vom Zaubern unterbrochen. Versucht also HoTs auf dem Tank aufrecht zu erhalten.",
	},
	
	[23578] = {  -- Jan'alai (Zul'Aman)
		"{rt1}Phase 1: Weicht dem kegelförmig vor einen zufällig ausgewählten Spieler gespeitem SPELL(43140) und daraus folgenden Lavapfützen aus - auch der Tank!",
		"Nietet einen der Brutwächter um und lasst den anderen die Welpen schlüpfen.",
		"Der Tank krallt sich alle geschlüpften Welpen und die DDs bomben sie weg.",
		"{rt3}Phase 2: Der Boss teleportiert sich in die Mitte des Altars und verteilt SPELL(42630) auf der gesamten Plattform. Sucht euch eine Lücke, bleibt dort stehen und wartet bis die Kugeln explodieren.",
		"{rt4}Phase 3: Bei 35% schlüpfen alle noch übrigen Welpen.",
		"Bei 25% gerät der Boss in SPELL(44779). Zündet in dieser Phase Heldentum/ Kampfrausch/ Zeitkrümmung und all eure Spezialfähigkeiten.",
	},
	
	[23577] = { -- Halazzi (Zul'Aman)
		"{rt1}Phase 1: Sobald ein SPELL(97500) auftaucht, zieht der Tank den Boss sofort aus dem grünem Heilkreis heraus. Fernkämpfer stellen sich jedoch hinein, um Mana und TP zu regenerieren.",
		"{rt3}Phase 2: Konzentriert euch auf den Troll, da der Luchs nicht tankbar ist. Den ausgeteilten Schaden vom Luchs kompensiert ihr durch das Nutzen der noch aus P1 übrig gebliebenen Heilkreise.",
		"Zerstört sofort alle SPELL(43302) und entfernt SPELL(43303) von betroffenen Spielern.",
		"{rt4}Phase 3: Ab 25% nutzt Halazzi all seine Fähigkeiten aus P1 und P2 auf einen Schlag. Zündet hier Spezialfähigkeiten sowie Heldentum/ Kampfrausch/ Zeitkrümmung.", 
	},
	
	[24239] = { -- Hexlord Malacrass (Zul'Aman)
		"Setzt Malacrass' Gefährten mit Kontrollfähigkeiten (Schafen, Verhexen, etc.) außer Gefecht. Stehen euch keine zur Verfügung, müsst ihr die Begleiter töten, bevor ihr auf den Boss geht.",
		"Malacrass beschießt euch alle 30 Sek. mit SPELL(43383) und verringert mit SPELL(44131) euren ausgeteilten Schaden um 1%. Im Gegenzug wird seiner um 1% erhöht.",
		"Danach entzieht der Boss einem zufällig ausgewähltem Spieler seine Seele. Je nach Klasse des Spielers, hat er nun neue Fähigkeiten auf Lager.",
		"WICHTIG: Unterbrechen! Oberste Priorität haben alle Heilzauber, danach die Schadensfähigkeiten.",
	},
	[23863] = {  -- Daakara (Zul'Aman)
		"{rt1}Phase 1: Heilt den von SPELL(97639) betroffenen Spieler voll, damit die Blutung verschwindet.",
		"{rt3} Phase 2 und 3: Jeweils eines von folgenden Tieravataren:",
		"Bär: Der vom Boss am weitesten entfernt stehende Spieler kassiert den Debuff SPELL(42402) und läuft danach sofort in Nahkampfreichweite, um nicht ein zweites Mal getroffen zu werden. Wechselt euch mit dem Kassieren des Debuffs ab.",
		"Adler: Geht den Wirbelstürmen aus dem Weg und zerstört das Blitzschlagtotem.",
		"Drachenfalke: Weicht dem Flammenatem und den Lavakreisen aus.",
		"Luchs: Konzentriert euch auf den großen Luchs und zündet schadensreduzierende Fähigkeiten, solltet ihr von der Blutung betroffen sein.",
	},
	
	-- Zul'Gurub
	[52155] = { -- Hohepriester Venoxis (Zul'Gurub)
		"{rt1}Phase 1: Geht der grünen Giftspur SPELL(97338) aus dem Weg. INFO: Sie verläuft immer nach dem selben Muster. Sucht euch also im Voraus schon feste Plätze.",
		"Seid ihr durch SPELL(96475) mit einem anderen Spieler verbunden, lauft so weit voneinander weg, bis die Verbindung bricht. ACHTUNG: Bei der Auflösung der Verbindung entsteht eine SPELL(97093).",
		"{rt3}Phase 2: Weicht dem  kegelförmig vor dem Boss entstehendem SPELL(96509) aus, umgeht die grünen Giftpfützen und geht den drei durch SPELL(97104) herbeigerufenen Ranken aus dem Weg – auch der Tank!",
		"Ist SPELL(97104) abgelaufen, leidet Venoxis unter SPELL(96653) und erleidet 10 Sekunden lang 100% mehr Schaden.", 
	},
	[52151] = { -- Blutfürst Mandokir (Zul'Gurub)
		"Weicht frühzeitig Mandokirs SPELL(96740) aus. Die Attacke kündigt sich durch rötlichen Staub am Boden an.",
		"Wird der Raptor freigelassen, müssen sich alle DDs sofort auf das Reittier konzentrieren und es schnell zu Fall bringen. Tut ihr es nicht tötet er die Geister. TIPP: Nutzt Verlangsamungseffekte!",	
		"Das SPELL(96684) trifft immer einen zufällig ausgewählten Spieler und tötet diesen umgehend. Ihr könnt die Fähigkeit nicht unterbrechen, hinauszögern oder aufhalten.",
		"Seid ihr tot, opfert sich ein Geist für euch auf und erweckt euch wieder. Da euch nur 8 Geister, sprich 8 Wiederbelebungen, zur Verfügung stehen, muss der Boss spätestens nach dem Aufbrauchen aller Geister sterben.",
		"ACHTUNG Heiler: Versucht nur den Tank zu heilen. Die TP der DDs lasst ihr so gut es geht außer Acht, damit sich der Boss durch SPELL(96776) nicht zu stark hochheilt.", 
	},

	[52286] = { -- Wushoolay Hort des Wahnsinns (Zul'Gurub)
		"Stellt euch mit Abstand zueinander auf, um SPELL(96713) zu entgehen und geht aus der über euch schwebenden SPELL(96711) heraus.",
		"In regelmäßigen Abständen verwandelt sich Wushoolay in eine Blitzkugel und stürmt einen zufällig ausgewählten Spieler an. Rennt sofort vom Einschlagsort weg, damit ihr nicht von der direkt danach folgenden Fähigkeit SPELL(96699) umgenietet werdet.", 
	},
	[52269] = { -- Renataki Hort des Wahnsinns (Zul'Gurub)
		"Weicht Renatakis SPELL(96646) aus, um nicht unnötig Schaden und die fiese Blutung SPELL(96644) zu kassieren.",
		"ACHTUNG Heiler: Da der Boss regelmäßig einem Spieler 100.000 Lebenspunkte abluchst, müsst ihr die Gruppe stets vollheilen, um Opfer zu vermeiden.", 
	},
	[52258] = { -- Gri'lek Hort des Wahnsinns (Zul'Gurub)
		"Werdet Ihr von Gri'lek verfolgt (blauer Pfeil auf eurem Kopf und unübersehbare Nachricht in der Mitte eures Bildschirms), müsst ihr sofort von dem Boss weglaufen und euch in Sicherheit bringen.",
		"Weicht außerdem dem Erdbeben aus, dass sich durch aufgewirbeltem Staub am Boden frühzeitig ankündigt.",
	}, 

	[52271] = { -- Hazza'rah Hort des Wahnsinns (Zul'Gurub)
		"In regelmäßigen Abständen ruft Hazza'rah mit Hilfe von SPELL(96658) vier geisterhafte Gegner herbei, die jeweils einen Spieler mit SPELL(96757) außer Gefecht setzen.",
		"Der nicht befallene Spieler muss sofort eines der Geister umnieten, um den dadurch festgesetzten Spieler zu befreien und ihn damit vorm Tod von SPELL(96758) zu bewahren.",
		"Befreit nach und nach eure gesamte Gruppe, um wieder Schaden am Boss zu machen.", 
	},
	[52059] = { -- Hohepriesterin Kilnara (Zul'Gurub)
		"{rt1}Phase 1: Unterbrecht so häufig wie es geht SPELL(96956) und SPELL(96435).",
		"Habt ihr SPELL(96435) nicht unterbrochen, müsst ihr außer Nahkampfreichweite laufen, um keinen Schaden zu erleiden.",
		"Stellt euch stets hinter die optisch gut sichtbare SPELL(96457), um nicht von ihr überrollt und getötet zu werden.",
		"TANK: Schnapp dir nach und nach eine der vier Panthergruppen und lass die DDs sie töten.",
		"DDs: Hat der Tank eine Panthergruppe gepullt, müsst ihr diese sofort umnieten. Prügelt Kilnaras TP erst auf 50% runter, sobald alle Panther tot sind.",
		"{rt3}Pjhase 2: Nutzt Cooldown-Fähigkeiten wie Heldentum/ Kampfrausch/ Zeitkrümmung.", 
	},

	[52053] = { -- Zanzil (Zul'Gurub)
		"Weicht dem auf dem Boden entlanglaufendem Arkanstrahl SPELL(96914) aus.",
		"Je nachdem welchen Trank Zanzil nutzt, erscheint eine farblich markierte Nachricht in der Mitte eures Bildschirms auf die ihr unterschiedlich reagieren müsst:",
		"Grün =  SPELL(96338) = JEDER klickt auf den grünen Kessel, um sich den Buff SPELL(96328) abzuholen und damit die Phase lebend zu überstehen.",
		"Rot = SPELL(96319) = DDs klicken den roten Kessel an, um den Buff SPELL(96326) zu erhalten und damit die vom Tank eingesammelten Zanzili Zombies zu vernichten.",
		"Blau = SPELL(96316) = EIN FERNKÄMPFER klickt auf den blauen Kessel, um den Buff SPELL(96325) zu bekommen und damit den herbeigerufenen Berserker einzufrieren und schnell zu vernichten.", 
	},

	[52148] = {-- Jin'do (Zul'Gurub)
		"{rt1}Phase 1: Der Tank zieht den Boss sofort aus der grün leuchtenden SPELL(97170) heraus.",
		"Beginnt der Boss SPELL(97172) zu casten, begebt ihr euch ALLE sofort unter die grüne Kuppel – auch der Tank!",
		"{rt3}Phase 2: Weicht stets den SPELL(97158) auf dem Altarboden aus.",
		"Alle Spieler, außer der Tank, stellen sich direkt zu einer der drei Ketten. Teilt euch so auf, dass immer mindestens ein Spieler bei einer Kette steht.",
		"TANK: Ziehe ein Gurubashi-Geist die Plattform hoch und lass es mit SPELL(97198) einen Spieler anspringen, um damitdas Schild der Ketten zu zerstören.",
		"Sobald ein Schild gesprengt wurde, zerstören die DDs die nun freiliegende Kette.", 
	},

};
	
bosses_loot = {
	[2955] = {"LOOOOOOT"},
	-- Zul'Aman
	[23574] = {"ITEM(52019)"},
	[23576] = {"ITEM(52019)"},
	[23578] = {"ITEM(52019)"},
	[23577] = {"ITEM(52019)"},
	[24239] = {"ITEM(52019)"},
	[23863] = {"ITEM(52019)"},
	-- Zul'Gurub
	[52155] = {"ITEM(52019)"},
	[52151] = {"ITEM(52019)"},
	[52286] = {"ITEM(52019)"},
	[52269] = {"ITEM(52019)"},
	[52258] = {"ITEM(52019)"},
	[52271] = {"ITEM(52019)"},
	[52059] = {"ITEM(52019)"},
	[52053] = {"ITEM(52019)"},
	[52148] = {"ITEM(52019)"},
};

bosses_achievements = {
	[2955] = {"ERFOLGE"},
	-- Zul'Aman
	[23577] = {"ACHIEVEMENT(5750)"},
	[23574] = {"ACHIEVEMENT(5750)"},
	[23863] = {"ACHIEVEMENT(5760)"},
	-- Zul'Gurub
	[52155] = {"ACHIEVEMENT(5743)"},
	[52151] = {"ACHIEVEMENT(5762)"},
	[52059] = {"ACHIEVEMENT(5765)"},
	[52148] = {"ACHIEVEMENT(5759)"},
};