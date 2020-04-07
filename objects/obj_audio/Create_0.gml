/// @description config audio

/// Volume Principal do jogo
volume = 6

/// Mixer de volume do jogo
mixer = array_create(2, 5)

/// Canais de Som do jogo
sound = array_create(16, 0)

/// Audio desligado
mute = false

audio_group_load_progress(audiogroup_default)
audio_channel_num(16)