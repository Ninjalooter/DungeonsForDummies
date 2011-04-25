function NL_debug(msg)
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

local function NL_ParseItemCallback(id)
	local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount = GetItemInfo(id);
	if sLink == nil then
		return "ITEM_UNKNOWN(" + id + ")"
	end
	return sLink;
end

-- Parses a text and searches for a KEYWORD(<number>), where KEYWORD is the given @param key.
-- The value between the paranthesis is then passed to the given handler. The searched passage
-- is then replaced with the return value of the handler.
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
