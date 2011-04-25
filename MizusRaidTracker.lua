-- ---
-- Copied from http://www.supausweich.kilu.de/dkp/wow%20addons/MizusRaidTracker-v0.25-Beta/MizusRaidTracker/MizusRaidTracker.lua
-- on 24.04.2011 by stephan.zeissler@moinz.de
--
-- Modifications:
-- - Renamed function - prefixed with NL_
-- --


-- ********************************************************
-- **              Mizus RaidTracker - Core              **
-- **           <http://nanaki.affenfelsen.de>           **
-- ********************************************************
--
-- This addon is written and copyrighted by:
--    * Mizukichan @ EU-Thrall (2010)
--
-- Contributors:
--    * Kevin (HTML-Export) (2010)
--
--    This file is part of Mizus RaidTracker.
--
--    Mizus RaidTracker is free software: you can redistribute it and/or 
--    modify it under the terms of the GNU General Public License as 
--    published by the Free Software Foundation, either version 3 of the 
--    License, or (at your option) any later version.
--
--    Mizus RaidTracker is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with Mizus RaidTracker.  
--    If not, see <http://www.gnu.org/licenses/>.
---------------------------------------- 

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
