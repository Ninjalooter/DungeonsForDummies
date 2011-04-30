-- Makes it possible to open the frame
-- with a slash command
SLASH_NINJADUNGEONGUIDE1, SLASH_NINJADUNGEONGUIDE2 = '/dungeonsfordummies', '/dfd'; 
function SlashCmdList.NINJADUNGEONGUIDE(msg, editbox)
	if not DFD_Frame_IsVisible() then
		DEFAULT_CHAT_FRAME:AddMessage("Zeige DFD-Fenster ...");
		DFD_Frame_Show(false);
	else
		DEFAULT_CHAT_FRAME:AddMessage("Verstecke DFD-Fenster ...");
		DFD_Frame_Hide();
	end
end