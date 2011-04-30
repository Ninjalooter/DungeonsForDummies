function NL_debug(msg)
	if true then
		return
	end
	
	if type(msg) == "nil" then
		NL_debug("NL_debug(nil)");
	elseif type(msg) == "string" or type(msg) == "number" then
		DEFAULT_CHAT_FRAME:AddMessage(msg);
	elseif type(msg) == "table" then
		NL_debug("<table>");
		for key,value in pairs(msg) do 
			NL_debug("<entry>");
			NL_debug(key);
			NL_debug(value);
			NL_debug("</entry>");
		end
		NL_debug("</table>");
	else
		NL_debug("NL_debug() for unknown type: " .. type(msg));
	end
end


---------------------------------------- 
-- 
-- Writes the description for the selected npc (@see NL_currentNpcId)
-- to the chat. It also descides automatically whether to write to
-- raid, party or say-chat.
--
-- The @param type can either be "LOOT", "ACHIEVEMENTS" or "GUIDE".
function NL_WriteDescription(npcid, type)
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
		SendChatMessage(NL_AutoLinkText(text), chatMode, language, name);
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



---------------------------------------- 

function NL_AutoLinkText(text)
    return NL_parseSpellID(NL_ParseAchievementID(NL_ParseItemID(text)));
end

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
		return "ITEM_UNKNOWN(" + id + ")";
	end
	return sLink;
end

-- Parses a text and searches for a KEYWORD(<number>), where KEYWORD is the given @param key.
-- The value between the paranthesis is then passed to the given handler. The searched passage
-- is then replaced with the return value of the handler.
--
-- Copied from RobBossMods.lua and later modified.
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
