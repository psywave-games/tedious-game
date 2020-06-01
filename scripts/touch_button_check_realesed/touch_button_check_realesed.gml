/// @arg0 buttonindex
var _button = argument0 - gp_face1

return not (game.app.input.internal_new_buttons >> _button & 1)
	and (game.app.input.internal_old_buttons >> _button & 1)