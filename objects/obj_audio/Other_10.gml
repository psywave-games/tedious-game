/// @description ev_init

if game.app.state == fsm_game.intro and sound_music[0] != snd_music_happy then
	music_play(0, snd_music_menu)
	
else if game.app.state == fsm_game.play and not game.app.started then
	music_play(0, snd_music_happy)
	
else if game.app.state == fsm_game.credits and sound_music[0] != snd_music_menu then
	music_play(0, snd_music_menu)