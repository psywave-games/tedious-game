/// @description ev_init

if game.app.state == fsm_game.intro and sound[0] != music_happy then
	music_play(0, music_menu)
	
else if game.app.state == fsm_game.play and not game.app.started then
	music_play(0, music_happy)
	
else if game.app.state == fsm_game.credits and sound[0] != music_menu then
	music_play(0, music_menu)