/// @script draw_background
/// @descript draw a background screen
/// @arg0 color
/// @arg1 alpha

draw_set_color(argument0)
draw_set_alpha(argument1)
draw_rectangle(
	0,0,
	display_get_gui_width(),
	display_get_gui_height(),
	false
)