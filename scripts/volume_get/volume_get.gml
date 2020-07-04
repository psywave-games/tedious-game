/// @description [0..100]
/// @arg0 mixer

switch argument0 begin 
	case volume_fx:
		return game.app.audio.mixer_fx
		
	case volume_music:
		return game.app.audio.mixer_music
		
	case volume_voice:
		return game.app.audio.mixer_voice
		
	default:
		return game.app.audio.volume
end