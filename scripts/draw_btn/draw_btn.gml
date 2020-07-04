/// @arg0 x
/// @arg1 y
/// @arg2 color
/// @arg3 pressed

var _xx = argument0
var _yy = argument1
var _color = argument2
var _size = sqrt(display_get_gui_height() * display_get_gui_width())/24
var _pressed = mouse_in_circle(_xx, _yy, _size) and game.app.input.mouse

draw_set_color(_color)
draw_set_alpha(_pressed?0.64:1.0)
draw_circle(_xx, _yy, _size, false)

draw_set_color(c_black)
draw_set_alpha(1.0000)
draw_circle(_xx, _yy, _size, true)

return _pressed