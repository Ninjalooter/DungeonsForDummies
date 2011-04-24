-- bla bla bla
NL_currentNpcId = nil;

function NL_WriteDescription(type)
	local npcid = NL_currentNpcId;
	local name = bosses_names[npcid];
	
	DEFAULT_CHAT_FRAME:AddMessage("Schreibe Beschreibung fuer " .. name .. " / " .. npcid);
	
	local language = GetDefaultLanguage("player");
	local chatMode = "SAY";
	if GetNumPartyMembers() > 5 then
		chatMode = "RAID"
	elseif GetNumPartyMembers() > 1 then
		chatMode = "PARTY";
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

	--DEFAULT_CHAT_FRAME:AddMessage("Name: "..uname.." guid: "..guid .. " NPC-ID: " .. npcid);

	if bosses_names[npcid] == nil then
		return false, nil
	else
		return true, npcid
	end
end
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

function NL_Init()
	Frame1:Hide() -- Hide the frame initally
	
	DEFAULT_CHAT_FRAME:AddMessage("Viel Spaﬂ mit dem Ninjalooter Instanz Addon!");
	DEFAULT_CHAT_FRAME:AddMessage("Besucht uns auf http://www.ninjalooter.de");
end

local frame = CreateFrame("frame")
frame:RegisterEvent("PLAYER_TARGET_CHANGED");
frame:SetScript("OnEvent", NL_OnEvent);

---------------------------------------- 
-- Copied from http://www.supausweich.kilu.de/dkp/wow%20addons/MizusRaidTracker-v0.25-Beta/MizusRaidTracker/MizusRaidTracker.lua

-- GetNPCID - returns the NPCID or nil, if GUID was no NPC
function NL_GetNPCID(GUID)
    local first3 = tonumber("0x"..strsub(GUID, 3, 5));
    local unitType = bit.band(first3, 0x007);
    if ((unitType == 0x003) or (unitType == 0x005)) then
        local _, _, _, uiVersion = GetBuildInfo();
        if (uiVersion < 40000) then
            -- WoW client previous to 4.0.1 (China)
            return tonumber("0x"..strsub(GUID, 9, 12));
        else
            -- WoW client 4.0.x (rest of the world)
            return tonumber("0x"..strsub(GUID, 7, 10));
        end
    else
        return nil;
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