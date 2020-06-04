/// @arg0 x1
/// @arg1 y1
/// @arg2 x2
/// @arg3 y2

var _xx0 = argument0
var _yy0 = argument1
var _xx1 = argument2
var _yy1 = argument3

if show_debug(2) then
	draw_rectangle(_xx0, _yy0, _xx1, _yy1, true)

for (var mouse = 0; mouse < 5; mouse++) begin
	var _xx = device_mouse_x_to_gui(mouse)
	var _yy = device_mouse_y_to_gui(mouse)
	
	if point_in_rectangle(_xx, _yy, _xx0, _yy0, _xx1, _yy1) then
		return true	
end

return false