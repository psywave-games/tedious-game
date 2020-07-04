/// @arg0 char
var _char = argument0 

if _char == " " or _char == "." or _char == "!" or _char == "?" then 
	return false
	
var _audio = choose(
	snd_voice_00,
	snd_voice_01,
	snd_voice_02,
	snd_voice_03,
	snd_voice_04,
	snd_voice_05,
)
	
audio_stop(game.app.audio.sound_voice)
game.app.audio.sound_voice = _audio
audio_play_sound(game.app.audio.sound_voice, 0, false)
audio_sound_gain(game.app.audio.sound_voice, gain_get(volume_voice), 0)
audio_sound_pitch(game.app.audio.sound_voice, 1.0)
return true