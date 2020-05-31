/// @description play sound sfx in position
/// @arg0 x
/// @arg1 y
/// @arg2 sound
/// @arg3 loop

var xx = argument0
var yy = argument1
var sound = argument2
var loop = argument3

/// buscar por buffer channel vazio
for (var channel = 0; channel <= 12; channel++) begin
	/// Todos os canais lotados sortear um para esvaziar
	if channel == 12 begin
		channel = irandom(11)
		audio_stop_sound(game.app.audio.sound_fx[channel])
		break
	end
	
	/// Canal vazio
	if not audio_is_playing(game.app.audio.sound_fx[channel]) then
		break
end

game.app.audio.index_fx[channel] = sound
game.app.audio.sound_fx[channel] = audio_play_sound_on(game.app.audio.emitter[channel], sound, loop, channel)
audio_emitter_position(game.app.audio.emitter[channel], xx, yy * 3, 0)
audio_emitter_gain(game.app.audio.emitter[channel], gain_get(volume_fx))
audio_emitter_pitch(game.app.audio.emitter[channel], 1.0)

/// retornar id do audio
return channel