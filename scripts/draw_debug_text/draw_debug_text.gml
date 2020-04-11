/// @arg0 x
/// @arg1 y
/// @arg2 text

var _w = string_width(argument2)
var _h = string_height(argument2)

draw_rectangle(
	argument0, 
	argument1 - _h/2,
	argument0 + _w,
	argument1 + _h/2,
	true
)