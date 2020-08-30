/// @descripition stop playing music
if browser() then
	web_music_stop()

else if audio_is_playing(game.app.audio.sound_music) begin
	audio_stop_sound(game.app.audio.sound_music)
	audio_destroy_stream(game.app.audio.sound_music)
	game.app.audio.atual_music = ""
end