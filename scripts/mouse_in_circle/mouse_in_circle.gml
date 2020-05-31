/// @arg0 x
/// @arg1 y
/// @arg2 size

var _xx0 = argument0
var _yy0 = argument1
var _size = argument2

for (var mouse = 0; mouse < 5; mouse++) begin
	var _xx = device_mouse_x_to_gui(mouse)
	var _yy = device_mouse_y_to_gui(mouse)
	
	if point_in_circle(_xx, _yy, _xx0, _yy0, _size) then
		return true
end
return false