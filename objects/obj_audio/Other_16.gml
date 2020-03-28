/// @description ev_lite_step

if game.app.state == fsm_game.intro and not audio_is_playing(game.app.audio.sound[0]) then
	music_play(0, sound_menu)
