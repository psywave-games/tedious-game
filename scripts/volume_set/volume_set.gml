/// @descripiton [0...100]
/// @arg0 mixer
/// @arg1 volume

var _mixer = argument0
var _volume = argument1



switch _mixer begin

	case volume_master:
		game.app.audio.volume = _volume
		if game.app.audio.mute then
			audio_master_gain(0)
		else
			audio_master_gain(gain_get(volume_master))
		break
		
	case volume_fx:
		game.app.audio.mixer[volume_fx] = _volume
		for (var i = 0; i < array_length_1d(game.app.audio.sound_fx); i++) begin
			audio_emitter_gain(game.app.audio.emitter[i], gain_get(volume_fx))
		end break
		
	case volume_music:
		game.app.audio.mixer[volume_music] = _volume
		audio_sound_gain(game.app.audio.sound_music, gain_get(volume_music), 0)
		break
end