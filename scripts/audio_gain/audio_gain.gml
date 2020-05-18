/// @description sound gain
/// @arg0 sound
var _sound = argument0
var _gain = argument1

for (var c = 0; c < array_length_1d(game.app.audio.sound_fx); c++) begin
	if game.app.audio.index_fx[c] == _sound then
		audio_emitter_gain(game.app.audio.emitter[c], gain_get(volume_fx) * _gain)
end