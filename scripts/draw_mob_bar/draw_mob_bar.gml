/// @arg0 x
/// @arg1 y
/// @arg2 size
/// @arg3 name

var _with = argument0
var _xx = argument1
var _yy = argument2
var _size = argument3
var _max = variable_instance_get(_with, "item_maxbar_" + string(argument4))
var _value = variable_instance_get(_with, "item_ready_" + string(argument4))
var _atual = (_max - abs(_value)) / _max

var _xa1 = _xx - (_size/2)
var _xa2 = _xx + (_size * _atual) - (_size/2)

draw_set_color(c_white)
draw_rectangle(_xx - (_size/2), _yy, _xx + (_size/2), _yy, false)

if _atual > 0.01 begin
	draw_set_color(color(color_vermelho))
	draw_rectangle(_xa1, _yy, _xa2, _yy, false)
end