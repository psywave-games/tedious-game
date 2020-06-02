/// @arg0 x
/// @arg1 y

var _xx0 = argument0
var _yy0 = argument1
var _distance = 0xFFFFFF

for (var mouse = 0; mouse < 5; mouse++) begin
	var _xx = device_mouse_x_to_gui(mouse)
	var _yy = device_mouse_y_to_gui(mouse)
	
	_distance = min(point_distance(_xx, _yy, _xx0, _yy0), _distance)
end
return _distance