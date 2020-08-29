/// @description set lang and title game
/// @arg0 lang

/// set language
game.app.lang = argument0
global.language = argument0 == msg.pt? "pt": "en"

/// rename window title
window_set_caption(t(msg.game_name))

/// continue to game
if game.app.state == fsm_game.lang 
	or game.app.state == fsm_game.loaded 
	or game.app.state == fsm_game.waitFocus begin
	state_reset(game.app, fsm_game.warn)
end