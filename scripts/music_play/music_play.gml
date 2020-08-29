/// @arg0 channel
/// @arg1 index

music_stop()

game.app.audio.atual_music = argument0
game.app.audio.sound_music = audio_create_stream(argument0)
audio_play_sound(game.app.audio.sound_music, 0, true)
audio_sound_gain(game.app.audio.sound_music, gain_get(volume_music), 0)
audio_sound_pitch(game.app.audio.sound_music, 1.0)