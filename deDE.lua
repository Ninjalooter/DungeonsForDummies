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
		[23574] = "Akil'zon - Zul'Aman",
};


bosses_taktik = {

	[2955] = { "Zeile 1", "Zeile 2 ITEM(63274)", "Zeile 3 ACHIEVEMENT(507)", "Zeile 4 {Kreuz} SPELL(75331)"}, -- Ebenenschreiter (Mulgore)

	-- Zul'Aman
	[23574] = { -- Akil'zon (Zul'Aman)
		"{rt1}Phase 1: Adler",
		"Steht verteilt zueinander, damit SPELL(43661) nicht an mehreren Spielern Schaden verursacht.",
		"Taucht ein weißer Adler auf, richtet ihr sofort all eure Schadensfähigkeiten auf ihn. Der große Vogel hat immer oberste Priorität. Denn holt ihr ihn nicht schnell genug vom Himmel, stirbt der entführte Spieler an SPELL(97318).",
		"{rt3}Phase 2: Sturm",
		"Der von SPELL(43648) betroffene Spieler wird in die Luft katapultiert. Stellt euch sofort unter den in der Luft schwebenden Spieler, in das Auge des Sturms, um den Blitzen um ihn herum zu entgehen. Steht ihr zu weit weg, sterbt ihr"
	},
	[23576] = { -- Nalorakk (Zul'Aman)
		"{rt1}Phase 1: Troll",
		"Der am weitesten vom Boss entfernte Spieler wird angestürmt und erhält den Debuff SPELL(42402).",
		"Da die Attacke zusätzlich Schaden an Spielern in der näheren Umgebung vom Angestürmten macht, müsst ihr euch leicht verteilt um den Boss aufstellen.",
		"Habt ihr den Debuff kassiert, lauft ihr sofort in Nahkampfreichweite Richtung Tank, um nicht ein zweites Mal von SPELL(42402) getroffen zu werden.",
		"Achtet darauf, dass immer Spieler ohne Debuff vom Boss entfernt stehen und sich Spieler mit Debuff beim Tank positionieren.",
		"{rt3}Phase 2: Bär",
		"Der Boss verteilt Blutungen, SPELL(42397), SPELL(42395), die eurem Tank ordentlich zusetzen und vom Heiler mit Zaubern kompensiert werden müssen. ",
		"Durch SPELL(42398) werdet ihr regelmäßig 2 Sekunden vom Zaubern unterbrochen. Versucht also HoTs auf dem Tank aufrecht zu erhalten, um die Stillephasen zu überbrücken.",
	},
	
	[23578] = {  -- Jan'alai (Zul'Aman)
		"{rt1}Phase 1: Schlüpfen der Eier",
		"In regelmäßigen Abständen speit der Boss einen SPELL(43140) kegelförmig in Richtung eines zufällig ausgewählten Spielers. Weicht ihm und den darauf folgenden Lavapfützen sofort aus – auch der Tank!",
		"Erscheinen zwei Brutwächter schnappt ihr euch sofort einen der Trolle und nietet ihn um. Lasst den anderen zu den Eiern durchlaufen und die Welpen schlüpfen lassen.",
		"Der Tank krallt sich alle geschlüpften Falken und die DDs bomben sie zügig weg.",
		"{rt3}Phase 2: Feuerbomben",
		"Der Boss teleportiert sich in die Mitte des Altars und verteilt SPELL(42630) auf der gesamten Plattform. Sucht euch eine Lücke, bleibt dort stehen und wartet bis die Kugeln explodieren.",
		"{rt4}Phase 3: Enrage",
		"Bei 35% von Jan'alais Trefferpunkten schlüpfen alle noch übrigen Welpen. Sammelt sie schnell ein und vernichtet sie.",
		"Bei 25% seiner Lebenspunkte gerät der Boss in SPELL(44779). Zündet in dieser Phase Heldentum/ Kampfrausch/ Zeitkrümmung und all eure Spezialfähigkeiten.",
	},
	
	[23577] = { -- Halazzi (Zul'Aman)
		"{rt1}Phase 1: Luchsavatar",
		"Stellt Halazzi ein SPELL(97500) auf, zieht der Tank den Boss sofort aus dem grünem Wirkungskreis heraus, damit er sich nicht heilt. Der Rest der Gruppe kann sich je nach Bedarf jedoch selber hineinstellen, um Mana und Trefferpunkte zu regenerieren.",
		"{rt3}Phase 2: Troll und Luchs",
		"Splittet der Boss sich in Troll und Luchs, konzentriert euch auf den Troll und ignoriert den Luchs.",
		"Der Luchs ist nicht tankbar, springt von Spieler zu Spieler und hinterlässt den stapelbaren Debuff SPELL(43243). Der eintreffende Schaden durch den Luchs muss gegengeheilt werden.",
		"Taucht ein SPELL(43302) auf, zerstört es umgehend.",
		"Spieler die Magie entfernen können, sollten SPELL(43303) vom betroffenen Spieler entfernen.",
		"{rt4}Phase 3: Endspurt",
		"Ab 25% seiner Lebenspunkte nutzt Halazzi alle Fähigkeiten aus Phase 1 und 2 auf einen Schlag. Zündet hier all eure Spezialfähigkeiten sowie Heldentum/ Kampfrausch/ Zeitkrümmung.", 
	},
	
	[24239] = { -- Hexlord Malacrass (Zul'Aman)
		"Kümmert euch zuerst um Malacrass' Gefährten. Nutzt je nach Gegner Kontrollfähigkeiten, wie Schafen, Verhexen oder Verbannen. Stehen euch keine zur Verfügung, müsst ihr beide Begleiter töten, bevor ihr euch dem Boss zuwendet.",
		"Malacrass beschießt euch alle 30 Sekunden mit SPELL(43383) und verringert zusätzlich im gleichen Takt mit SPELL(44131) euren ausgeteilten Schaden um 1%. Seiner wird jedoch zeitgleich um 1% erhöht.",
		"Direkt danach entzieht der Boss einem zufällig ausgewähltem Spieler seine Seele. Je nach Klasse des Spielers, hat Malacrass nun neue Fähigkeiten auf Lager.",
		"WICHTIG: Unterbrechen ist das A und O in diesem Kampf!",
		"Oberste Priorität beim Unterbrechen haben sämtliche Heilzauber. Erst danach sind Schadensfähigkeiten dran.",
	},
	[23863] = {  -- Daakara (Zul'Aman)
		"{rt1}Phase 1: Troll",
		"Heilt den von SPELL(97639) betroffenen Spieler voll, damit die Blutung verschwindet.",
		"{rt3} Phase 2 und 3: Tieravatare",
		"Bär: Der vom Boss am weitesten entfernt stehende Spieler kassiert den Debuff SPELL(42402). Einmal getroffen, läuft er sofort in Nahkampfreichweite, um nicht ein zweites Mal getroffen zu werden und damit zu sterben. Wechselt euch mit dem Kassieren des Debuff ab.",
		"Adler: Geht den Wirbelstürmen aus dem Weg und zerstört das Blitzschlagtotem.",
		"Drachenfalke: Weicht dem Flammenatem und den Lavakreisen aus.",
		"Luchs: Fokussiert euch auf den großen Luchs und zündet schadensreduzierende Fähigkeiten, solltet ihr von der Blutung betroffen sein.",
	},
	
	-- Zul'Gurub
	[52155] = { -- Hohepriester Venoxis (Zul'Gurub)
		"{rt1}Phase 1: Troll",
		"Geht der grünen Giftspur SPELL(97338) auf dem Boden aus dem Weg, um keinen Schaden zu erleiden. INFO: Sie verläuft immer nach dem selben Muster. Sucht euch also im Voraus schon feste Plätze.",
		"Seid ihr durch SPELL(96475) miteinander verbunden, lauft so weit voneinander weg, bis die Verbindung bricht. ACHTUNG: Rennt jedoch nicht in Richtung eines anderen Spielers, da bei der Auflösung der Verbindung eine SPELL(97093) entsteht, die allen nahen Spielern Schaden zufügt.",
		"{rt3}Phase 2: Schlange",
		"Weicht dem  kegelförmig vor dem Boss entstehendem SPELL(96509) aus, umgeht die grünen Giftpfützen und geht den drei durch SPELL(97104) herbeigerufenen Ranken aus dem Weg – auch der Tank!",
		"Ist SPELL(97104) abgelaufen, leidet Venoxis unter SPELL(96653) und erleidet 10 Sekunden lang 100% mehr Schaden.", 
	},
	[52151] = { -- Blutfürst Mandokir (Zul'Gurub)
		"Weicht immer rechtzeitig Mandokirs SPELL(96740) aus. Die Attacke kündigt sich frühzeitig durch rötlichen Staub am Boden an.",
		"Wird der Raptor Ohgan freigelassen müssen sich alle DDs sofort auf das Reittier konzentrieren und es schnell zu Fall bringen. Tut ihr es nicht tötet er eure lebensrettenden Geister am Rande der Arena. TIPP: Nutzt Verlangsamungseffekte!",	
		"Das SPELL(96684) trifft immer einen zufällig ausgewählten Spieler und tötet diesen umgehend. Ihr könnt die Fähigkeit nicht unterbrechen, hinauszögern oder aufhalten.",
		"Liegt ihr im Dreck, opfert sich ein Geist für euch auf und erweckt euch wieder. Da euch nur 8 Geister, sprich 8 Wiederbelebungen, zur Verfügung stehen, muss Mandokir spätestens nach dem Aufbrauchen all dieser Geister das Zeitliche segnen. Tut er es nicht, nimmt er euch Stück für Stück auseinander.",
		"ACHTUNG Heiler: Versucht nur den Tank zu heilen. Die Lebenspunkte der DDs lasst ihr so gut es geht außer Acht, damit sich der Boss durch SPELL(96776) nicht zu stark hochheilt.", 
	},

	[52286] = { -- Wushoolay Hort des Wahnsinns (Zul'Gurub)
		"Stellt euch mit Abstand zueinander auf, um SPELL(96713) zu entgehen und geht aus der über euch schwebenden SPELL(96711) heraus.",
		"In regelmäßigen Abständen verwandelt sich Wushoolay in eine Blitzkugel und stürmt einen zufällig ausgewählten Spieler an. Rennt sofort vom Einschlagsort weg, damit ihr nicht der direkt danach folgenden Fähigkeit SPELL(96699) umgenietet werdet.", 
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
		"{rt1}Phase 1: Troll",
		"Unterbrecht so häufig wie es geht SPELL(96956) und SPELL(96435).",
		"Habt ihr SPELL(96435) nicht unterbrochen, müsst ihr außer Nahkampfreichweite laufen, um keinen Schaden zu erleiden.",
		"Stellt euch stets hinter die optisch gut sichtbare SPELL(96457), um nicht von ihr überrollt und getötet zu werden.",
		"TANK: Schnapp dir nach und nach eine der vier Panthergruppen und lass die DDs sie töten, damit sie euch nicht in der zweiten Phase das Leben schwer machen.",
		"DDs: Hat der Tank eine Panthergruppe gepullt, müsst ihr diese sofort umnieten. Prügelt Kilnaras Lebenspunkte erst auf 50% runter, sobald alle Panther tot sind.",
		"{rt3}Pjhase 2: Panther",
		"Nutzt Cooldown-Fähigkeiten wie Heldentum/ Kampfrausch/ Zeitkrümmung.", 
	},

	[52053] = { -- Zanzil (Zul'Gurub)
		"Weicht dem auf dem Boden entlanglaufendem Arkanstrahl SPELL(96914) aus.",
		"Je nachdem welchen Trank Zanzil nutzt, erscheint eine farblich markierte Nachricht in der Mitte eures Bildschirms auf die ihr unterschiedlich reagieren müsst:",
		"Grün =  SPELL(96338) = JEDER klickt auf den grünen Kessel, um sich den Buff SPELL(96328) abzuholen und damit die Phase lebend zu überstehen.",
		"Rot = SPELL(96319) = DDs klicken den roten Kessel an, um den Buff SPELL(96326) zu erhalten und damit die vom Tank eingesammelten Zanzili Zombies zu vernichten.",
		"Blau = SPELL(96316) = EIN Fernkämpfer klickt auf den blauen Kessel, um den Buff SPELL(96325) zu bekommen und damit den herbeigerufenen Berserker einzufrieren und schnell zu vernichten.", 
	},

	[52148] = {-- Jin'do (Zul'Gurub)
		"{rt1}Phase 1: Lebende Ebene",
		"TANK: Ziehe den Boss sofort aus der grün leuchtenden SPELL(97170) heraus.",
		"Beginnt der Boss SPELL(97172) zu casten, begebt ihr euch ALLE sofort unter die grüne Kuppel – auch der Tank!",
		"{rt3}Phase 2: Zwischenebene",
		"Weicht stets den SPELL(97158) auf dem Altarboden aus.",
		"Alle Spieler, außer der Tank, stellen sich direkt zu einer der drei Ketten. Teilt euch so auf, dass immer mindestens ein Spieler bei einer Kette steht.",
		"TANK: Ziehe einen der Gurubashi-Geister die Plattform hoch und lass ihn mit SPELL(97198) eines der Schilder auf den Ketten zerstören.",
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