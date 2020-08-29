/// @arg0 music_index

if not music_playing_any()
	return false

if game.app.audio.atual_music != argument0 then 
	return false
	
return true