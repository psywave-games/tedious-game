/// @descripiton [0...100]
/// @arg0 mixer
/// @arg1 volume

var _mixer = argument0
var _volume = argument1



switch _mixer begin

	case volume_master:
		game.app.audio.volume = _volume
		/// mute game
		if game.app.audio.mute then
			audio_master_gain(0)
		/// unmute game
		else
			audio_master_gain(gain_get(volume_master))
			
		/// browser music volume
		if is_browser then
			web_music_volume(gain_get(volume_music) * (!game.app.audio.mute? gain_get(volume_master): 0))
		break
		
	case volume_fx:
		game.app.audio.mixer_fx = _volume
		for (var i = 0; i < array_length_1d(game.app.audio.sound_fx); i++) begin
			audio_emitter_gain(game.app.audio.emitter[i], gain_get(volume_fx))
		end break
		
	case volume_music:
		game.app.audio.mixer_music = _volume
	
		/// browser music volume
		if is_browser then
			web_music_volume(gain_get(volume_music) * (!game.app.audio.mute? gain_get(volume_master): 0))
			
		/// game music
		else 
			audio_sound_gain(game.app.audio.sound_music, gain_get(volume_music), 0)
		break
end