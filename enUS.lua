-- Makros
-- ======
-- SPELL(<id>)
-- ACHIEVEMENT(<id>)
-- ITEM(<id>)

function NL_GetLocale_enUS()
	local YELLOW = "|cFFFFD700";
	local RESET = "|r";
	
	
	-- Text Labels
	local L = {};
	L["WELCOME"] = {
		'Welcome to the Ninjalooter Addon Dungeons for Dummies!',
		"You can visit us at " .. YELLOW .. "http://www.ninjalooter.de" .. RESET .. " - but its german",
		"Enter " .. YELLOW .. "/dungeonsfordummies" .. RESET .. " or " .. YELLOW .. "/dfd" .. RESET .. " to open the DFD frame manually."
	};
	L["Bosstaktik"] = "Guide";
	L["Erfolge"] = "Achievements";
	L["Automatisch|nschlie\195\159en"] = "Auto Close Frame";
	L["Verstecke DFD-Fenster (Kampf) ..."] = "Hiding DFD Frame - combat started";
	
	
    local BOSS_NAMES = {
            -- Testsubject [2955] = "Plainstrider",
            --Endzeit
			[54123] = "Echo of Sylvanas",
			[54544] = "Echo of Tyrande",
			[54431] = "Echo of Baine",
			[54445] = "Echo of Jaina",
			[54432] = "Murozond",
			--Brunnen der Ewigkeit
			[55085] = "Pero'tharn",
			[54853] = "Queen Azshara",
			[54969] = "Mannoroth",
			--Stunde des Zwielichts
			[54590] = "Arcurion",
			[54968] = "Asira Dawnslayer",
			[54938] = "Arcbishop Benedictus",
    };

    local BOSSES_MENU_STRUCTURE = {
        -- Testsubject ["Mulgore"] = {2955},
        ["End Time"] = {
			54123,
			54544,
			54431,
			54445,
			54432
		},
		
		["Well of Eternity"] = {
			55085,
			54853,
			54969
		},
		
		["Hour of Twilight"] = {
			54590,
			54968,
			54938
		},
    };


    local bosses_taktik = {

        [2955] = {"Zeile  TEST", "Zeile 2 ITEM(3300)", "Zeile 3 ACHIEVEMENT(507)"}, -- Plainstrider (Mulgore)

       -- Endzeit
		[54123] = {-- Echo von Sylvanas(Endzeit)
			"{rt1}Phase 1: Stay out of purple stuff on the ground. kill the ghoul everyone's DPSing and then run over its corpse and away from Sylvanas.",
			"{rt3}Phase 2: Kill the ghoul everyone's DPSing and then run over its corpse and away from Sylvanas."
		},
		
		[54544] = {-- Echo von Tyrande(Endzeit)
			"{rt1}Interrupt Stardust and blow your cooldowns at 30%.",
			"If you are ranged, don't get close to her and move away, if she turns to face you."
		},
		
		[54431] = {-- Echo von Baine(Endzeit)
			"{rt1}Pick up Baines totems and throw them back at him.",
			"If he stomps and therefore destroys an island that you're on, swim to a new one quickly."
		},
		
		[54445] = {-- Echo von Jaina(Endzeit)
			"{rt1} Avoid all big white blades that pop out of the ground.",
			"If you see a fire ember on the ground, stand IN it to keep it from damaging the whole group."
		},
		
		[54432] = {-- Murozond(Endzeit)
			"{rt1}Stay out of all big golden circles, never stay right in front nor behind him.",
			"Pop all your cooldowns whenever time resets.",
		},
		-- Brunnen der Ewigkeit
		[55085] = {-- Peroth'arn (Brunnen der Ewigkeit)
			"{rt1}Phase 1: Stay out of all the green stuff on the ground.",
			"{rt3}Phase 2: Hide behind the pillars so that the eyes can't see you when you are stealthed."
		},
		
		[54853] = {-- Königin Azshara (Brunnen der Ewigkeit)
			"{rt1}Kill the puppet strings on Mind-Controlled players as quickly as possible, and avoid all bad AoE stuff on the ground.",
			" ALWAYS interrupt Azshara's Total Obedience ability."
		},
		
		[54969] = {-- Mannoroth (Brunnen der Ewigkeit)
			"{rt1} Stay out of all bad AoE stuff and keep adds off your healer and Tyrande.",
			"Focus on Mannoroth once Varo'then is dead."
		},
		
		-- Stunde des Zwielichts
		[54590] = {-- Arcurion (Stunde des Zwielichts)
			"{rt1}Interrupt Hand of Frost, kill Ice Tombs as sooon as possible, and stay out of all blue circles on the ground."
		},
		
		[54968] = {-- Asira Dämmerschlächter (Stunde des Zwielichts)
			"{rt1}Stay out of Smoke Bomb but always try to stand in the light circles left by Thrall's totems.",
			" If you are a caster, try to keep the tank or Thrall standing between yourself and Asira."
		},
		
		[54938] = {-- Erzbischof Benedictus (Stunde des Zwielichts)
			"{rt1}Spread out, dispel Righteous Shear and Twilight Shear and interrupt Smite and Twilight Blast.",
			"Stay out of all waves that are coming at you."
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
		[54431] = {"No achievement available. See ACHIEVEMENT(6117)"},
		[54445] = {"No achievement available. See ACHIEVEMENT(6117)"},
		[54432] = {"No achievement available. See ACHIEVEMENT(6117)"},
			-- Brunnen der Ewigkeit
		[55085] = {"ACHIEVEMENT(6127)"},
		[54853] = {"No achievement available. See ACHIEVEMENT(6118)"},
		[54969] = {"ACHIEVEMENT(6070)"},
			-- Stunde des Zwielichts
		[54590] = {"No achievement available. See ACHIEVEMENT(6119)"},
		[54968] = {"No achievement available. See ACHIEVEMENT(6119)"},
		[54938] = {"ACHIEVEMENT(6132)"}
    };
    
    return L, BOSS_NAMES, BOSSES_MENU_STRUCTURE, bosses_taktik, bosses_loot, bosses_achievements;
 end 