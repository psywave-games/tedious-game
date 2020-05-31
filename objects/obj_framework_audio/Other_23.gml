/// @description ev_mygame_end

/// stop all audios
for (var c = 0; c < array_length_1d(game.app.audio.sound_fx); c++) begin
	audio_stop_sound(game.app.audio.sound_fx[c])
end