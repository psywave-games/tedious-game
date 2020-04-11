/// @arg0 x
/// @arg1 y
/// @arg2 text

var _w = string_width(argument2)
var _h = string_height(argument2)

var _xx = device_mouse_x_to_gui(0)
var _yy = device_mouse_y_to_gui(0)

return point_in_rectangle(_xx, _yy, argument0, argument1 - _h/2, argument0 + _w, argument1 + _h/2)

