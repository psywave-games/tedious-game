/// @arg0 x
/// @arg1 y
/// @arg2 text

var _w = string_width(argument2)
var _h = string_height(argument2)

var _xx0 = 0
var _yy0 = 0
var _xx1 = 0
var _yy1 = 0

#region HORIZONTAL
if draw_get_halign() == fa_left begin
	_xx0 = argument0
	_xx1 = argument0 + _w
end 
else if draw_get_halign() == fa_right begin
	_xx0 = argument0 - _w
	_xx1 = argument0
end 
else begin
	_xx0 = argument0 - _w/2
	_xx1 = argument0 + _w/2
end
#endregion

#region VERTICAL
if draw_get_valign() == fa_top begin
	_yy0 = argument1
	_yy1 = argument1 + _h
end 
else if draw_get_valign() == fa_bottom begin
	_yy0 = argument1 - _h
	_yy1 = argument1
end 
else begin
	_yy0 = argument1 - _h/2
	_yy1 = argument1 + _h/2
end
#endregion

if show_debug(2) then
	draw_rectangle(_xx0, _yy0, _xx1, _yy1, true)

return mouse_in_rectangle(_xx0, _yy0, _xx1, _yy1)