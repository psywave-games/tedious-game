/// @arg0 index

var xx = argument0
var yy = argument1
var sound = argument2
var channel = 3

if audio_is_playing(game.app.audio.sound[channel]) then
	audio_stop_sound(game.app.audio.sound[channel])

game.app.audio.sound[channel] = audio_play_sound(sound, 0, false)
audio_mixer(game.app.audio.mixer[channel > 2], channel)

return game.app.audio.sound[channel]