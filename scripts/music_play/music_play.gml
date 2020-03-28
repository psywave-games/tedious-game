/// @arg0 channel
/// @arg1 index

var channel = argument0 

if audio_is_playing(game.app.audio.sound[channel]) then
	audio_stop_sound(game.app.audio.sound[channel])

game.app.audio.sound[channel] = audio_play_sound(argument1, 0, true)
audio_mixer(game.app.audio.mixer[channel > 2], channel)

return game.app.audio.sound[channel]