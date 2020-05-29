/// @description ev_init

if game.app.state == fsm_game.warn and not music_playing_is(snd_music_sad) then
	music_play(snd_music_sad)
	
else if game.app.state == fsm_game.play and not music_playing_is(snd_music_happy) then
	music_play(snd_music_happy)
	
else if game.app.state == fsm_game.credits and not music_playing_is(snd_music_menu) then
	music_play(snd_music_menu)