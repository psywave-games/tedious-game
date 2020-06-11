/// @description audio is playing
/// @arg0 sound
var _sound = argument0

for (var c = 0; c < array_length_1d(game.app.audio.sound_fx); c++) begin
	if game.app.audio.index_fx[c] == _sound and audio_is_playing(game.app.audio.sound_fx[c]) then
		return true
end

return false