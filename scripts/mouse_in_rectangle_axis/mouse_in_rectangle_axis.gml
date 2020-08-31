/// @arg0 x1
/// @arg1 y1
/// @arg2 x2
/// @arg3 y2

var _xx0 = argument0
var _yy0 = argument1
var _xx1 = argument2
var _yy1 = argument3
var _xxm = (_xx0 + _xx1) / 2

if debug(debug_mode_mousehover) begin
	draw_set_color(c_white)
	draw_rectangle( _xx0, _yy0, _xx1, _yy1, true)
	draw_line(_xxm, _yy0, _xxm, _yy1)
end

for (var mouse = 0; mouse < 5; mouse++) begin
	var _xx = device_mouse_x_to_gui(mouse)
	var _yy = device_mouse_y_to_gui(mouse)
	
	if point_in_rectangle(_xx, _yy, _xx0, _yy0, _xx1, _yy1) then
		return _xxm < _xx? 1: -1
end

return 0