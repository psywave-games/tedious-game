/// @description [0..100]
/// @arg0 mixer

if argument0 ==  volume_master then
	return game.app.audio.volume
	
return game.app.audio.mixer[argument0]