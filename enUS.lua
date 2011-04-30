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
            -- Zul'Aman
            [23574] = "Akil'zon",
            [23576] = "Nalorakk",
            [23578] = "Jan'alai",
            [23577] = "Halazzi",
            [24239] = "Hex Lord Malacrass",
            [23863] = "Daakara",
            -- Zul'Gurub
            [52155] = "High Priest Venoxis",
            [52151] = "Bloodlord Mandokir",
            [52286] = "Wushoolay",
            [52269] = "Renataki",
            [52258] = "Gri'lek",
            [52271] = "Hazza'rah",
            [52059] = "High Priestess Kilnara",
            [52053] = "Zanzil",
            [52148] = "Jin'do",
    };

    local BOSSES_MENU_STRUCTURE = {
        -- Testsubject ["Mulgore"] = {2955},
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
            ["Edge of Madness"] = {
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

        [2955] = {"Zeile  TEST", "Zeile 2 ITEM(3300)", "Zeile 3 ACHIEVEMENT(507)"}, -- Plainstrider (Mulgore)

        -- Zul'Aman
        [23574] = { -- Akil'zon (Zul'Aman)
            "{rt1}Phase 1: Spread out 10 yards away from each other to prevent SPELL(97298) from hitting multiple targets.",
            "As soon as the white Hawk, the Amani Kidnapper, appears the party needs to switch to the hawk and drop it ASAP as the kidnapped player will die from SPELL(97318).",
            "Kidnapped players are able to attack and heal. You can also ice block or bubble to avoid the damage portion.",
            "{rt3}Phase 2: Occasionally a random player will be taken up in the air through SPELL(43648). At this point all other players need to run under the affected member to prevent getting hit by lightning and therefore die.",
        },
        [23576] = { -- Nalorakk (Zul'Aman)
            "{rt1}Phase 1: The farthest away player gets hit by Nalorakk and suffers for 20 sec. from SPELL(42402).",
            "Did you get hit by SPELL(42402) run in and stand right behind the boss to not get charged again and therefore die.",
            "Make sure all players with debuff stand next to the boss and everyone without the debuff stands far away.",
            "{rt3}Phase 2: Nalorakk casts SPELL(97810), SPELL(97811) on the tank. Both bleed effects need to be outhealed by the healer.",
            "Your casts will regularly be interrupted by SPELL(42398). Make sure to keep up some HoTs on the tank.",
        },
        
        [23578] = {  -- Jan'alai (Zul'Aman)
            "{rt1}Phase 1: Avoid getting hit or running through SPELL(97497).",
            "As soon as the first two Amani'shi Hatchers appear, kill one of them and let the other one run through to open up all eggs at one side of the altar.",
            "Tank aggros all hatched Amani Dragonhawk Hatchlings and the party AOEs them down.",
            "{rt3}Phase 2: Jana'lai teleports to the middle of the altar and casts SPELL(42630) all over the platform. Look for a save place and stay there until all the bombs exploded.",
            "{rt4}Phase 3: At 35% all remaining Hatchlings will appear at once.",
            "At 25% the boss will enrage. Use all your Cooldowns such as Heroism, Time Warp.",
        },
        
        [23577] = { -- Halazzi (Zul'Aman)
            "{rt1}Phase 1: As soon as a SPELL(97500) appears, the tank drags Halazzi away from it. In exchange all ranged players stand in the green circle to regenerate mana and life.",
            "Don't ever kill the Water Totem! Ranged players love it :)",
            "{rt3}Phase 2: Concentrate on the troll because the Spirit of the Lynx is not tankable. Damage taken through the lynx should be compensated by standing in the remaining healing circles from Phase 1.",
            "ALWAYS destroy summoned SPELL(97492) immediately and remove SPELL(97490) from affected players.",
            "{rt4}Phase 3: At 25% Halazzi combines both phases and uses all his abilities at once. Use all your Cooldowns such Heroism, Time Warp during this last phase.", 
        },
        
        [24239] = { -- Hexlord Malacrass (Zul'Aman)
            "Depending on the two adds that stand next to the boss, you can CC or kill them.",
            "Every 30 sec. Malacrass will fire SPELL(43383) at the party and will reduce your damage output through SPELL(44131) by 1%. In return his will increase by 1%.",
            "After that he will randomly select a player from your group and take over his powers. Depending on which class the player has, Malacrass now uses different kinds of abilities.",
            "IMPORTANT: Interrupt all healing spells!",
        },
        [23863] = {  -- Daakara (Zul'Aman)
            "{rt1}Phase 1: In order to remove the bleeding effect of SPELL(97639), you have to heal the affected player completely.",
            "{rt3} Phase 2 und 3: Randomly two of four different avatars:",
            "Bear: The farthest away player gets hit by Daakara and suffers from SPELL(42402). Players with that debuff stand near boss, players without it stand far away from him. Remove SPELL(43095) from all players.",
            "Eagle: Dodge the cyclones and destroy the Lightning Totem.",
            "Dragonhawk: Constantly avoid SPELL(43208) and SPELL(97855).",
            "Lynx: Kill the two adds first to avoid the extra damage on your group. After they are dead concentrate an Daakara.",
        },
        
        -- Zul'Gurub
        [52155] = { -- Hohepriester Venoxis (Zul'Gurub)
            "{rt1}Phase 1: Avoid getting hit or walking through the green line of venom SPELL(97338). INFO: It will always take the same path. So look for a save place and keep it in mind for next time.",
            "Are you linked to another player by SPELL(96475), run away from each other to break the link. But stay away from other party members as the broken link will erupt in a SPELL(97093) which deals AOE damage.",
            "{rt3}Phase 2: Tanks and all other group members need to avoid the SPELL(96509), the summoned SPELL(97104) and all sorts of green pools.",
            "After SPELL(97104), Venoxis will suffer from SPELL(96653), stunning him and making him take 100% mor damage for 10 sec. Use all Cooldowns such as Heroism, Time Warp during this phase.", 
        },
        [52151] = { -- Blutf\195\188rst Mandokir (Zul'Gurub)
            "Avoid Mandokir's SPELL(96740) by stepping out of the red dust that appears just seconds before he atttacks with this ability.",
            "As soon as the raptor is running towards a Chained Spirit, kill him as fast as possible. Slow, stun, snares - nearly everything works to keep him away from the ghosts.",	
            "SPELL(96684) is an instant-kill ability that you can't avoid. If you still have Chained Spirits available, these will offer you a resurrection.",
            "You only have 8 spirits at your disposal, each one granting you an one-time resurrection which also buffs Mandokir with SPELL(96662). Therefore you have to kill him fast.",
            "HEALERS: When Mandokir performs SPELL(96776) on a random player, don't heal him until the spell is over. Healing during the spell just leads to more damage being taken and wasted mana.", 
        },
        [52286] = { -- Wushoolay Hort des Wahnsinns (Zul'Gurub)
            "Spread out from each other to prevent SPELL(96713) from hitting multiple targets. Move out from SPELL(96711).",
            "He regularly transforms into a lightning orb and charges a randomly selected player.",
            "Instantly move away from that player to not get killed by SPELL(96699).", 
        },
        [52269] = { -- Renataki Hort des Wahnsinns (Zul'Gurub)
            "Run out of the whirlwinding path of Renataki's ability SPELL96645).",
            "HEALERS: Don't panic when Renataki uses SPELL(96640) an a player. Just heal him and everything will be fine.", 
        },
        [52258] = { -- Gri'lek Hort des Wahnsinns (Zul'Gurub)
            "Gri'lek periodically targets a player and runs after him. If you are the targeted person (blue arrow above your head) run away from the boss.",
            "Avoid the dust on the floor to not get hit by the spikes.",
        }, 
        [52271] = { -- Hazza'rah Hort des Wahnsinns (Zul'Gurub)
            "The boss summons four nightmares, that target a player and stuns them with SPELL(96757). If the add reaches the targeted player, it will use SPELL(96758) and kill the player.",
            "The player not stunned by the nightmares, needs to free the rest of the group by killing the nightmares.",
        },
        [52059] = { -- Hohepriesterin Kilnara (Zul'Gurub)
            "{rt1}Phase 1: Interrupt SPELL(96956) and SPELL(96435) as often as possible.",
            "Did you not interrupt SPELL(96435), you have to move out of melee range to avoid AOE damage.",
            "Always stand behind the purple SPELL(96457) to not get struck and therefore killed by it.",
            "TANK: Grab one pack of panthers after the other and let DPS kill it.",
            "DPS: Did your tank pull some Panthers kill them ASAP. Don't make damage on Kilnara until all panthers are dead.",
            "{rt3}Pjhase 2: Use all you cooldown abilities such as Heroism, Time Warp.", 
        },
        [52053] = { -- Zanzil (Zul'Gurub)
            "Zanzil will frequently cast SPELL(96914), creating a bright line of purple fire that deals ticking damage to anyone standing in it. MOVE OUT!",
            "Follow the instructions in the middle of your interface:",
            "Green =  SPELL(96338) = EVERYONE click on the green cauldron to get SPELL(96328) and therefore survive the green, toxic phase.",
            "Red = SPELL(96319) = TANK pick up the buff from the red cauldron SPELL(96326) and aggro the zombies. AEO them down.",
            "Blue = SPELL(96316) = A RANGE DPS clicks on the blue cauldron to get SPELL(96325). While having that buff, attack the Berserker to make massive damage and stun him.",
        },

        [52148] = {-- Jin'do (Zul'Gurub)
            "{rt1}Phase 1: Have the tank pull Jin'do immediately out of the green SPELL(97170).",
            "As soon as Jin'do starts casting SPELL(97172) EVERYONE moves into the green Deadzone.",
            "{rt3}Phase 2: Get out of the purple void zones SPELL(97158) and kill the Twisted Spirits (small ghosts).",
            "TANK: Pull a Gurubashi Spirit from the sides of the altar and tank it up on the platform.",
            "DPS: Keep your hands off the Berserker as long as the shields from the chains are up.",
            "Are you marked with an arrow upon your head, run to one of the shielded chains to break it. After destroying the shield you can DPS the chain.",
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
        [23574] = {"No achievement available. See ACHIEVEMENT(5761)"},
        [23576] = {"No achievement available. See ACHIEVEMENT(5761)"},
        [23578] = {"No achievement available. See ACHIEVEMENT(5761)"},
        [23577] = {"ACHIEVEMENT(5750)"},
        [24239] = {"No achievement available. See ACHIEVEMENT(5761)"},
        [23863] = {"ACHIEVEMENT(5760)"},
        -- Zul'Gurub
        [52155] = {"ACHIEVEMENT(5743)"},
        [52151] = {"ACHIEVEMENT(5762)"},
        [52286] = {"No achievement available. See ACHIEVEMENT(5744)"},
        [52269] = {"No achievement available. See ACHIEVEMENT(5744)"},
        [52258] = {"No achievement available. See ACHIEVEMENT(5744)"},
        [52271] = {"No achievement available. See ACHIEVEMENT(5744)"},
        [52059] = {"ACHIEVEMENT(5765)"},
        [52053] = {"No achievement available. See ACHIEVEMENT(5744)"},
        [52148] = {"ACHIEVEMENT(5759)"},
    };
    
    return L, BOSS_NAMES, BOSSES_MENU_STRUCTURE, bosses_taktik, bosses_loot, bosses_achievements;
 end 