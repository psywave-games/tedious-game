if os_browser != browser_not_a_browser then
	return true 

if game.app.state == fsm_game.loading then
	return false
	
return game.app.render.mode_emu_browser