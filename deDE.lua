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
			--Endzeit
			[54123] = "Echo von Sylvanas",
			[54544] = "Echo von Tyrande",
			[54431] = "Echo von Baine",
			[54445] = "Echo von Jaina",
			[54432] = "Murozond",
			--Brunnen der Ewigkeit
			[55085] = "Pero'tharn",
			[54853] = "K\195\182nigin Azshara",
			[54969] = "Mannoroth",
			--Stunde des Zwielichts
			[54590] = "Arcurion",
			[54968] = "Asira D\195\164mmerschl\195\164chter",
			[54938] = "Erzbischof Benedictus",
	};

	local BOSSES_MENU_STRUCTURE = {
		-- Testsubjekt ["Mulgore"] = {2955},
	
		["Endzeit"] = {
			54123,
			54544,
			54431,
			54445,
			54432
		},
		
		["Brunnen der Ewigkeit"] = {
			55085,
			54853,
			54969
		},
		
		["Stunde des Zwielichts"] = {
			54590,
			54968,
			54938
		},
	};


	local bosses_taktik = {
		[2955] = {"Zeile  TEST", "Zeile 2 ITEM(3300)", "Zeile 3 ACHIEVEMENT(507)"}, -- Ebenenschreiter (Mulgore)
		
		-- Endzeit
		[54123] = {-- Echo von Sylvanas(Endzeit)
			"{rt1}Phase 1: Raus aus den Schattenkreisen.",
			"{rt3}Phase 2: Den Ghoul umnieten, auf den alle anderen DDler gehen und nach seinem Tod in entgegengesetzer Richtung zu Sylvanas vom Ghoul weglaufen."
		},
		
		[54544] = {-- Echo von Tyrande(Endzeit)
			"{rt1}Unterbrecht Sternenstaub und z\195\188ndet Eure Cooldowns bei 30%.",
			"Fernk\195\164mpfer bleiben von Tyrande weg; visiert sie Euch an, sucht das Weite."
		},
		
		[54431] = {-- Echo von Baine(Endzeit)
			"{rt1}Schnappt Euch Baines Totems und werft sie ihm direkt ins Gesicht.",
			"Zerst\195\182rt er eine der Lavainseln auf denen Ihr Euch befindet, schwimmt schnell zur n\195\164chsten."
		},
		
		[54445] = {-- Echo von Jaina(Endzeit)
			"{rt1}Geht den wei\195\159en , aus dem Boden sprie\195\159enden Stacheln aus dem Weg.",
			"Seht Ihr eine Feuerkugel auf dem Boden, stellt Euch in sie hinein, um Gruppenschaden zu vermeiden."
		},
		
		[54432] = {-- Murozond(Endzeit)
			"{rt1}Weicht den goldenen Kreisen aus, steht nicht direkt vor und auch nicht hinter dem Boss.",
			"Z\195\188ndet all Eure Cooldowns sobald die Zeit zur\195\188ckgedreht wurde.",
		},
		
		-- Brunnen der Ewigkeit
		[55085] = {-- Peroth'arn (Brunnen der Ewigkeit)
			"{rt1}Phase 1: Weicht allen gr\195\188nen Kreisen auf dem Boden aus.",
			"{rt3}Phase 2: Versteckt Euch hinter den S\195\164ulen, damit Euch die Augen nicht entdecken."
		},
		
		[54853] = {-- Königin Azshara (Brunnen der Ewigkeit)
			"{rt1}T\195\182tet umgehend die Puppenspielerh\195\164nde, sollten sie einen Spieler \195\188bernommen haben und weicht allen fl\195\164chendeckenden Schadendsquellen auf dem Boden aus.",
			"Unterbrecht IMMER Azsharas Zauber Absolute H\195\182rigkeit."
		},
		
		[54969] = {-- Mannoroth (Brunnen der Ewigkeit)
			"{rt1}Weicht allen fl\195\164chendeckenden Schadensquellen aus und nehmt dem Heiler sowie Tyrande regelm\195\164\ssig die Adds ab.",
			"Konzentriert Euch auf Mannoroth, sobald Varothen tot ist."
		},
		
		-- Stunde des Zwielichts
		[54590] = {-- Arcurion (Stunde des Zwielichts)
			"{rt1}Unterbrecht Hand des Frosts, zerst\195\182rt die Eisgr\195\164ber und weicht den blauen Kreisen aus."
		},
		
		[54968] = {-- Asira Dämmerschlächter (Stunde des Zwielichts)
			"{rt1}Steht nicht in der Rauchbombe (dunkler Nebel), seht aber zu, stets in Thralls gelb leuchtendem Totemkreis zu stehen.",
			"Fernk\195\164mpfer sollten daf\195\188r sorgen, dass Thrall oder der Tank zwischen ihnen und Asira steht."
		},
		
		[54938] = {-- Erzbischof Benedictus (Stunde des Zwielichts)
			"{rt1}Verteilt Euch, nehmt die Debuffs Rechtschaffene Scherung und Zwielichtscherung von den Spielern und unterbrecht Heilige Pein und Zwielichtdruckwelle.",
			"Weicht au\195\159erdem immer sofort den herannst\195\188rmenden Wellen aus."
		},
	};
		
	local bosses_loot = {
		[2955] = {"ITEM(3300)"},
		-- Endzeit
		[54123] = {"ITEM(72811), ITEM(72810), ITEM(72799)",
				   "ITEM(72804), ITEM(72801), ITEM(72800)",
				   "ITEM(72798), ITEM(72806), ITEM(72805)",
				   "ITEM(72802), ITEM(72807), ITEM(72803)"},
		[54544] = {"ITEM(72812), ITEM(72813), ITEM(72799)",
				   "ITEM(72804), ITEM(72801), ITEM(72800)",
				   "ITEM(72798), ITEM(72806), ITEM(72805)",
				   "ITEM(72802), ITEM(72807), ITEM(72803)"},
		[54431] = {"ITEM(72814), ITEM(72815), ITEM(72799)",
				   "ITEM(72804), ITEM(72801), ITEM(72800)",
				   "ITEM(72798), ITEM(72806), ITEM(72805)",
				   "ITEM(72802), ITEM(72807), ITEM(72803)"},
		[54445] = {"ITEM(72808), ITEM(72809), ITEM(72799)",
				   "ITEM(72804), ITEM(72801), ITEM(72800)",
				   "ITEM(72798), ITEM(72806), ITEM(72805)",
				   "ITEM(72802), ITEM(72807), ITEM(72803)"},
		[54432] = {"ITEM(72897), ITEM(72821), ITEM(72816)",
				   "ITEM(72820), ITEM(72826), ITEM(72824)",
				   "ITEM(72822), ITEM(72818), ITEM(72819)",
				   "ITEM(72825), ITEM(72817), ITEM(72823)",
				   "ITEM(71636)"},			
		
		-- Brunnen der Ewigkeit
		[55085] = {"ITEM(72832), ITEM(72827), ITEM(72830)",
				   "ITEM(72831), ITEM(72829), ITEM(72828)"},
		[54853] = {"ITEM(72837), ITEM(72836), ITEM(72833)",
				   "ITEM(72834), ITEM(72838), ITEM(72835)",
				   "ITEM (71635)"},
		[54969] = {"ITEM(72846), ITEM(72841), ITEM(72845)",
				   "ITEM(72898), ITEM(72844), ITEM(72842)",
				   "ITEM(72839), ITEM(72848), ITEM(72840)",
				   "ITEM(72847), ITEM(72843), ITEM(72899)"},
				   
		-- Stunde des Zwielichts
		[54590] = {"ITEM(77957), ITEM(72853), ITEM(76150)",
				   "ITEM(72849), ITEM(72854), ITEM(72851)",
				   "ITEM(72850)"},
		[54968] = {"ITEM(72859), ITEM(72855), ITEM(76151)",
				   "ITEM(72860), ITEM(77957), ITEM(72857)",
				   "ITEM(72856), ITEM(71638)"},
		[54938] = {"ITEM(72863), ITEM(72862), ITEM(72867)",
				   "ITEM(72901), ITEM(72870), ITEM(72866)",
				   "ITEM(72868), ITEM(72865), ITEM(72861)",
				   "ITEM(72864), ITEM(72869), ITEM(72900)",
				   "ITEM(71637)"},		   
	
	};

	local bosses_achievements = {
		[2955] = {"ERFOLGE"},
			-- Endzeit
		[54123] = {"ACHIEVEMENT(6130)"},
		[54544] = {"ACHIEVEMENT(5995)"},
		[54431] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(6117)"},
		[54445] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(6117)"},
		[54432] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(6117)"},
			-- Brunnen der Ewigkeit
		[55085] = {"ACHIEVEMENT(6127)"},
		[54853] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(6118)"},
		[54969] = {"ACHIEVEMENT(6070)"},
			-- Stunde des Zwielichts
		[54590] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(6119)"},
		[54968] = {"Kein Erfolg vorhanden. Allgemein: ACHIEVEMENT(6119)"},
		[54938] = {"ACHIEVEMENT(6132)"},
	};
	
	return L, BOSS_NAMES, BOSSES_MENU_STRUCTURE, bosses_taktik, bosses_loot, bosses_achievements;
end