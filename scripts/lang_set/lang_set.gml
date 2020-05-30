/// @description set lang and title game
/// @arg0 lang

game.app.lang = argument0
window_set_caption(t(msg.game_name))

ini_open(database_file)
ini_write_string("framework game", "lang", game.app.lang == msg.pt? "pt": "en")
ini_close()

if game.app.state == fsm_game.lang then
	state_reset(game.app, fsm_game.warn)