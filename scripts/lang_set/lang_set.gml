/// @description set lang and title game
/// @arg0 lang

#region GAME SET LANGUAGE
game.app.lang = argument0
global.language = argument0 == msg.pt? "pt": "en"
#endregion
#region GAME SET TITLE
window_set_caption(t(msg.game_name))
#endregion
#region GAME GET CREDITS
var _file = file_text_open_read("CREDITS-" + string_upper(global.language) + ".md")
global.credits = ""
while not file_text_eof(_file) begin
	var _line = file_text_readln(_file)
	
	if string_pos("#", _line) != 0 then
		_line = string_replace_all(_line, "#", "")
	else if secret(thematic_nicolasc) and string_length(_line) > 2 then
		_line = t(msg.credits_nicolasc) + "\n"
    
	global.credits += _line
end
file_text_close(_file)
#endregion
#region SAVE SET LANGUAGE
ini_open(database_file)
database_include_string(database_global, "language", true)
ini_close()
#endregion
#region GAME CONTINUE
if game.app.state == fsm_game.lang 
	or game.app.state == fsm_game.loaded 
	or game.app.state == fsm_game.waitFocus begin
	state_reset(game.app, fsm_game.warn)
end
#endregion