/// @arg0 x1
/// @arg1 y1
/// @arg2 x2
/// @arg3 y2
/// @arg4 x3
/// @arg5 y3
/// @arg6 x4
/// @arg7 y4
/// @arg8 color1
/// @arg9 color2
/// @arg10 color3
/// @arg11 color4
/// @arg12 outline

var _x1 = argument0
var _y1 = argument1
var _x2 = argument2
var _y2 = argument3
var _x3 = argument4
var _y3 = argument5
var _x4 = argument6
var _y4 = argument7
var _color1 = argument8
var _color2 = argument9
var _color3 = argument10
var _color4 = argument11
var _outline = argument12

draw_triangle_color(_x1, _y1, _x2, _y2, _x3, _y3, _color1, _color2, _color3, _outline)
draw_triangle_color(_x2, _y2, _x3, _y3, _x4, _y4, _color2, _color3, _color4, _outline)