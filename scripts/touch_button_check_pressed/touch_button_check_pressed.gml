/// @arg0 buttonindex
var _button = argument0 - gp_face1

return (game.app.input.internal_new_buttons >> _button & 1)
	and not (game.app.input.internal_old_buttons >> _button & 1)