-- Makes it possible to open the frame
-- with a slash command
SLASH_NINJADUNGEONGUIDE1, SLASH_NINJADUNGEONGUIDE2 = '/ninjaguide', '/ng'; 
function SlashCmdList.NINJADUNGEONGUIDE(msg, editbox)
	if not Frame1:IsVisible() then
		DEFAULT_CHAT_FRAME:AddMessage("Zeige Instanz Info Fenster ...");
		NL_AutoCloseFrame = false;
		Frame1:Show();
	else
		DEFAULT_CHAT_FRAME:AddMessage("Verstecke Instanz Info Fenster ...");
		
		Frame1:Hide();
	end
end