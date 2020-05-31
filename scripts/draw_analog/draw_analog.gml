/// @arg0 x
/// @arg1 y
/// @arg2 color
/// @arg3 pressed

var _xx = argument0
var _yy = argument1
var _size = sqrt(display_get_gui_height() * display_get_gui_width())

/// border background
draw_set_alpha(1.0)
draw_set_color(make_color_rgb(129,183,117))
draw_circle(_xx, _yy, _size/8, false)

/// background
draw_set_alpha(1.0)
draw_set_color(make_color_rgb(91,106,120))
draw_circle(_xx, _yy, _size/9, false)

/// button
draw_set_color(make_color_rgb(62, 70, 80))
draw_set_alpha(1.0000)
draw_circle(_xx, _yy, _size/32, false)
draw_set_alpha(1.0)
draw_set_color(c_black)
draw_circle(_xx, _yy, _size/32, true)

/// outline
draw_set_alpha(1.0)
draw_set_color(c_black)
draw_circle(_xx, _yy, _size/8, true)

