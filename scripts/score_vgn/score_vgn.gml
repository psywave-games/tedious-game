if global.videogame_points <= 0 then
	return argument0
	
var _score = min(argument0, global.videogame_points)
global.videogame_points -= _score

score_add(_score)

return argument0