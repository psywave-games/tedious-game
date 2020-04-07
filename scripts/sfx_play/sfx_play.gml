/// @arg0 x
/// @arg1 y
/// @arg2 sound

var xx = argument0
var yy = argument1
var sound = argument2

/// buscar por buffer channel vazio
for (var channel = 3; channel <= 16; channel++) begin
	/// Todos os canais lotados sortear um para esvaziar
	if channel == 16 begin
		channel = random_range(3, 15)
		audio_stop_sound(game.app.audio.sound[channel])
		break
	end
	
	/// Canal vazio
	if not audio_is_playing(game.app.audio.sound[channel]) then
		break
end

/// tocar som
game.app.audio.sound[channel] = audio_play_sound_at(sound, xx, yy, 0, 100, 300, 1, false, 16)

/// regular volume conforme as configs
audio_mixer(game.app.audio.mixer[channel > 2], channel)

/// retornar id do audio
return game.app.audio.sound[channel]