/// @script draw_background
/// @descript draw a background screen
/// @arg0 color
/// @arg1 alpha

var _color = argument0
var _alpha = clamp(argument1, 0, 1)

draw_set_color(_color)
draw_set_alpha(_alpha)
draw_rectangle(
	0,0,
	display_get_gui_width(),
	display_get_gui_height(),
	false
)