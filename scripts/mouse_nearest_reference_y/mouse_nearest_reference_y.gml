/// @arg0 x

var _yy0 = argument0
var _yy1 = 0xFFFFFFF

for (var mouse = 0; mouse < 5; mouse++) begin
	var _yy = device_mouse_y_to_gui(mouse)
	
	if abs(_yy0 - _yy) < _yy1 then
		_yy1 = _yy - _yy0
end

return _yy1