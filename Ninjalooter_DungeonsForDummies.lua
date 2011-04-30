-- Main file for Ninjalooter_DungeonsForDummies
-- 

-- --
-- Auto Hide the Frame on combat start
local DFD_AutoHide = true;

-- --
-- Should be set with the npcId when the Frame is shown.
local NL_currentNpcId = nil;

-- --
-- Should the Frame be automatically closed, when the target is lost?
local NL_AutoCloseFrame = false;

--
-- Initializes the addon.
function NL_Init()
	local YELLOW = "|cFFFFD700";
	local RESET = "|r";
	-- Print a welcome message
	DEFAULT_CHAT_FRAME:AddMessage("Viel Spa\195\159 mit dem Ninjalooter Addon Dungeons for Dummies!");
	DEFAULT_CHAT_FRAME:AddMessage("Besucht uns auf " .. YELLOW .. "http://www.ninjalooter.de" .. RESET);
	DEFAULT_CHAT_FRAME:AddMessage("Benutzt " .. YELLOW .. "/dungeonsfordummies" .. RESET .. " oder " .. YELLOW .. "/dfd" .. RESET .. " um den Guide jederzeit zu \195\182ffnen.");
	
	DFD_Frame_Hide() -- Hide the frame initally
	NL_DFD_Frame:RegisterEvent("PLAYER_TARGET_CHANGED") -- Register for target changes
	NL_DFD_Frame:SetScript("OnEvent", NL_OnEvent);
end

function DFD_Frame_Hide()
	NL_DFD_Frame:Hide()
end

function DFD_Frame_Show(autoClose)
	autoClose = autoClose or true;
	
	NL_AutoCloseFrame = autoClose;
	NL_DFD_Frame:Show()
end

function DFD_Frame_IsVisible
	return NL_DFD_Frame:IsVisible()
end
-- 
-- Writes the description for the selected npc (@see NL_currentNpcId)
-- to the chat. It also descides automatically whether to write to
-- raid, party or say-chat.
--
-- The @param type can either be "LOOT", "ACHIEVEMENTS" or "GUIDE".
function NL_WriteDescription(type)
	local npcid = NL_currentNpcId;
	local name = bosses_names[npcid];
	
	DEFAULT_CHAT_FRAME:AddMessage("Schreibe Info f\195\188r " .. name .. " (NPC-ID: " .. npcid .. ")");
	
	local language = GetDefaultLanguage("player");
	local chatMode = nil;
	if GetNumRaidMembers() == 0 then -- Not a raid
		if GetNumPartyMembers() == 0 then -- No party
			chatMode = "SAY";
		else -- Party!!! :D
			chatMode = "PARTY";
		end
	else
		chatMode = "RAID"
	end
	
	list = nil	;
	if type == "LOOT" then
		list = bosses_loot;
	elseif type == "ACHIEVEMENTS" then
		list = bosses_achievements;
	elseif type == "GUIDE" then
		list = bosses_taktik;
	else
		return;
	end
	
	for index,text in ipairs(list[npcid]) 
	do
		SendChatMessage(NL_ParseItemID(NL_ParseAchievementID(NL_parseSpellID(text))), chatMode, language, name);
	end
end

-- Checks whether the current targeted unit is supported.
-- Supported means we have some infos for this boss.
function NL_IsTargetSupportedBoss()
	local uname, realm = UnitName("target")
	if uname == nil then
		return false, nil
	end
	local guid = UnitGUID("target");
	local npcid = NL_GetNPCID(guid);

	if npcid == nil then
		return false, nil
	end

	if bosses_names[npcid] == nil then
		return false, nil
	else
		return true, npcid
	end
end

-- OnEvent handler for "PLAYER_TARGET_CHANGED". 
-- Shows/Hides the frame depending whether the 
-- current target is supported.
--
-- @see NL_IsTargetSupportedBoss()
function NL_OnEvent(self, event,...)
	--NL_debug("OnEvent: " .. event);
	
	if event == "PLAYER_REGEN_ENABLED" and DFD_AutoHide then -- Combat started
		DFD_Frame_Hide();
	end
	
	if event == "PLAYER_TARGET_CHANGED" then
		if DFD_Frame_IsVisible() then
			local success, npcid = NL_IsTargetSupportedBoss();
			if success then
				NL_currentNpcId = npcid;
				DFD_Frame_Hide();
				DFD_Frame_Show(NL_AutoCloseFrame); -- Just reuse the prev. value
			else
				if NL_AutoCloseFrame then
					DFD_Frame_Hide()
				end
			end
		else 
			local success, npcid = NL_IsTargetSupportedBoss();
			
			if success then
				-- UIDropDownMenu_SetText(DropDownMenuButton, bosses_names[npcid]);
				NL_currentNpcId = npcid;
				DFD_Frame_Show(true); -- AutoClose the frame, when we lose the target
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------
function AutoCloseButton_OnShow()
	AutoCloseButton:SetChecked(NL_AutoCloseFrame);	
	AutoCloseButtonText:SetText("Automatisch|nschlie\195\159en");
end
function AutoCloseButton_OnClick()
	-- NL_debug("AutoCloseButton:OnClick");
	NL_AutoCloseFrame = not NL_AutoCloseFrame;
	AutoCloseButton:SetChecked(NL_AutoCloseFrame);
	
	if NL_AutoCloseFrame and not NL_IsTargetSupportedBoss() then
		-- NL_debug("Verstecke Fenster weil autoClose=yes and targetIsBoss=yes");
		DFD_Frame_Hide();
	end
end
------------------------------------------------------------------------------------------------------------------
function DropDownMenuButton_OnShow()
	-- NL_debug("DDB OnShow");
	if not (NL_currentNpcId == nil) then
		-- NL_debug("DDB OnShow " .. NL_currentNpcId);
		UIDropDownMenu_SetText(DropDownMenuButton, bosses_names[NL_currentNpcId]);
	end
end

function DropDownMenuItem_OnClick(self, id, arg2, checked)
	-- NL_debug("Selected NPC " .. bosses_names[id] .. " / " .. id );
	NL_currentNpcId = id;
	
	DropDownMenuButton_OnShow();
	
	ToggleDropDownMenu(1, nil, DropDownMenuButton);
end

function DropDownMenu_OnLoad(self, level)
	-- NL_debug("DDB Init - level " .. level);
	level = level or 1;
	
	local navValue = {};
	local current = BOSSES_MENU_STRUCTURE;
	local i = 1;
	while i < level	do		
		local key = UIDROPDOWNMENU_MENU_VALUE[i];
		navValue[i] = key;
		current = current[key];
		i = i + 1;
	end
	
	for key,value in pairs(current)
	do
		local info      = UIDropDownMenu_CreateInfo();
		-- Generate the menuitem depending on the type (either the npcid or an array for the submenu)
		if type(value) == "number" then -- We reached the end of the navigation => Show the boss
			-- key is a generic number, the index
			-- value is the npcid
			info.text 		= bosses_names[value];
			info.arg1       = value;
			info.func       = DropDownMenuItem_OnClick;
			info.checked    = (not (NL_currentNpcId == nil) and (value == NL_currentNpcId));
		else
			-- key is the text for the SubMenu
			-- value is the subMenu itself
			local copy = {};
			for j,x in ipairs(navValue) do copy[j] = x end
			copy[level] = key;
			
			info.text       = key;
			info.value      = copy;
			-- info.func       = DropDownMenuItem_OnClick;
			-- info.checked 	= (not (NL_currentNpcId == nil) and index == NL_currentNpcId);
			info.hasArrow   = true;
			info.notCheckable = true;
			info.keepShownOnClick  = true;
		end
		-- NL_debug("Adding entry " .. info.text);
		
		-- Add the above information to the options menu as a button.
		UIDropDownMenu_AddButton(info, level);	
	end
 end
   
function DropDownMenuButton_OnClick() 
    ToggleDropDownMenu(1, nil, DropDownMenuButton, "DropDownMenuButton", 0, 0);
end