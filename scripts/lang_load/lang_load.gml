/// @descripition select game langue or jump to game
/// @arg0 state

ini_open(database_file)

var _lang = ini_read_string("framework game", "lang", "")

/// portuguese
if _lang == "pt" then
	game.app.lang = msg.pt 
	
/// english
else if _lang == "en" then
	game.app.lang = msg.en
	
/// invalid language
else begin
	state_reset(game.app, fsm_game.lang)
	ini_close()
	exit
end

state_reset(game.app, fsm_game.warn)