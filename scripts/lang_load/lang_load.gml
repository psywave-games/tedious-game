/// @descripition select game langue or jump to game
/// @arg0 state

if global.language == "pt" then
	lang_set(msg.pt)
	
else if global.language == "en" then
	lang_set(msg.en)
	
else if os_get_language() == "pt" then
	lang_set(msg.pt)
	
else if os_get_language() == "en" then
	lang_set(msg.en)

/// invalid language
else state_reset(game.app, fsm_game.lang)