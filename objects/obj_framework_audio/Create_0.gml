/// @description config audio

/// Configs
audio_falloff_set_model(audio_falloff_linear_distance);
audio_group_load_progress(audiogroup_default)
audio_listener_orientation(0,1,0,0,0,1)
audio_channel_num(16)

/// Volume Principal do jogo
volume = 5
audio_master_gain(0.5)

/// Mixer de volume do jogo
mixer_fx = 5
mixer_music = 5
mixer_voice = 5

/// Audio desligado
mute = false

/// Canais de audio
sound_fx = array_create(12, 0)
index_fx = array_create(12, 0)
sound_music = 0

/// Emissores de Audio
emitter = array_create(12, 0)

for (var i = 0; i < 12; i++) begin
	emitter[i] = audio_emitter_create()
	audio_emitter_falloff(emitter[i], 64, 192, 2)
	audio_emitter_gain(emitter[i], 0.5)
end