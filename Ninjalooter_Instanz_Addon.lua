-- Main file for Ninjalooter_Instanz_Addon
-- 

-- 
-- Should be set with the npcId when the Frame is shown.
NL_currentNpcId = nil;

--
-- Initializes the addon.
function NL_Init()
	-- Print a welcome message
	DEFAULT_CHAT_FRAME:AddMessage("Viel Spa\195\159 mit dem Ninjalooter Instanz Addon!");
	DEFAULT_CHAT_FRAME:AddMessage("Besucht uns auf |cFFFFD700http://www.ninjalooter.de|r");
	
	Frame1:Hide() -- Hide the frame initally
	Frame1:RegisterEvent("PLAYER_TARGET_CHANGED") -- Register for target changes
	Frame1:SetScript("OnEvent", NL_OnEvent);
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
	
	DEFAULT_CHAT_FRAME:AddMessage("Schreibe Beschreibung fuer " .. name .. " / " .. npcid);
	
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
	--DEFAULT_CHAT_FRAME:AddMessage("OnEvent: " .. event);
	if event == "PLAYER_TARGET_CHANGED" then
		
		local success, npcid = NL_IsTargetSupportedBoss();
		
		--if npcid == nil then
		--	DEFAULT_CHAT_FRAME:AddMessage("NPC is nil!");
		--end
 		
		if success then
			-- UIDropDownMenu_SetText(DropDownMenuButton, bosses_names[npcid]);
			NL_currentNpcId = npcid;
			
			Frame1:Show(); 
		else
			Frame1:Hide();
		end
	end
end

---------------------------------------- 
-- Copied from RobBossMods.lua
function NL_parseSpellID(text)
	return NL_ParseKey(text, "SPELL", GetSpellLink);
end

-- Copied & Modified from RobBossMods' parseSpellId
function NL_ParseAchievementID(text)
	return NL_ParseKey(text, "ACHIEVEMENT", GetAchievementLink);
end

function NL_ParseItemID(text)
	return NL_ParseKey(text, "ITEM", NL_ParseItemCallback);
end

function NL_ParseItemCallback(id)
	local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount = GetItemInfo(id);
	if sLink == nil then
		return "ITEM__(" + id + ")"
	end
	return sLink;
end

function NL_ParseKey(text, key, handler) 
	local s = text:find(key)
	if s == nil then
		return text
	end
	local e = text:find(")",s)
	local temps = text:sub(s,e)
	local id = tonumber(temps:match("%d+"))
	
	---
	local s2 = text:find(key,e)
	if s2 == nil then
		if e+1 > #text then
			return text:sub(1,s-1)..handler(id)
		else
			return text:sub(1,s-1)..handler(id)..text:sub(e+1)
		end
	else
		--rekursion
		return text:sub(1,s-1)..handler(id)..NL_ParseKey(text:sub(e+1), key, handler)
	end
end

------------------------------------------------------------------------------------------------------------------

function DropDownMenuButton_OnShow()
	DEFAULT_CHAT_FRAME:AddMessage("DDB OnShow");
	if not (NL_currentNpcId == nil) then
		DEFAULT_CHAT_FRAME:AddMessage("DDB OnShow " .. NL_currentNpcId);
		UIDropDownMenu_SetText(DropDownMenuButton, bosses_names[NL_currentNpcId]);
	end
end

function DropDownMenuItem_OnClick(self, id, clicked)
	DEFAULT_CHAT_FRAME:AddMessage("CLICKED on " .. id .. "!!!!!!!!!!!!!!!!!!!!!!!!");
	NL_currentNpcId = id;
	
	DropDownMenuButton_OnShow();
end

function DropDownMenu_OnLoad()
	DEFAULT_CHAT_FRAME:AddMessage("DDB Init");
	
	for index,text in pairs(bosses_names)
	do
		local info      = {};
		info.text       = text;
		info.arg1      = index;
		info.func       = DropDownMenuItem_OnClick;
		info.checked 	= (not (NL_currentNpcId == nil) and index == NL_currentNpcId);

		-- Add the above information to the options menu as a button.
		UIDropDownMenu_AddButton(info);	
	end
	
	
 end
   
function DropDownMenuButton_OnClick() 
    ToggleDropDownMenu(1, nil, DropDownMenuButton, "DropDownMenuButton", 0, 0);
end