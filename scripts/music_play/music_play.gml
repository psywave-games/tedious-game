/// @arg0 channel
/// @arg1 index


if audio_is_playing(game.app.audio.sound_music) then
	audio_stop_sound(game.app.audio.sound_music)

game.app.audio.sound_music = argument0
audio_play_sound(game.app.audio.sound_music, 0, true)
audio_sound_gain(game.app.audio.sound_music, gain_get(volume_music), 0)
audio_sound_pitch(game.app.audio.sound_music, 1.0)