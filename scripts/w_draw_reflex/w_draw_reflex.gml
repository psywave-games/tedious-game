/// @description reflex world mobs
/// @example w_reflex( x, y, 0.8, 0.8, 0.75, -11, 0, [obj_sleep_bed, c_red, obj_chest, c_orange])
/// @arg0 x
/// @arg1 y
/// @arg2 width
/// @arg3 height
/// @arg4 alpha
/// @arg5 incrx
/// @arg6 incry
/// @arg7 mobs

var _xxbase = argument0
var _yybase = argument1
var _width = argument2
var _height = argument3
var _alpha = argument4
var _incrx = argument5
var _incry = argument6
var _mobs = argument7

for (var i = 0, j = array_length_1d(_mobs); i < j; i += 2) with _mobs[i] begin 
	var _xx = x - _xxbase + _incrx
	var _yy = y - _yybase + _incry
	var _xscale = image_xscale * _width
	var _yscale = image_yscale * _height
	var _sprite = sprite_index
	var _color = _mobs[i + 1]
	
	draw_sprite_ext(_sprite, image_index, _xx, _yy, _xscale, _yscale, image_angle, _color, _alpha)
end