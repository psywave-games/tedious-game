/// @description ev_init


if game.app.state == fsm_game.loaded begin
	volume_set(volume, volume_master)
	volume_set(mixer_fx, volume_fx)
	volume_set(mixer_music, volume_music)
	volume_set(mixer_voice, volume_voice)
end

else if game.app.state == fsm_game.warn and not music_playing_is("music/menu.ogg") then
	music_play("music/menu.ogg")
	
else if game.app.state == fsm_game.play and not game.app.started then
	music_play("music/game.ogg")
	
else if game.app.state == fsm_game.credits and not music_playing_is("music/credits.ogg") then
	music_play("music/credits.ogg")