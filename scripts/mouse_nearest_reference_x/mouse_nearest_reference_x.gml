/// @arg0 x

var _xx0 = argument0
var _xx1 = 0xFFFFFFF

for (var mouse = 0; mouse < 5; mouse++) begin
	var _xx = device_mouse_x_to_gui(mouse)
	
	if abs(_xx0 - _xx) < _xx1 then
		_xx1 = _xx - _xx0 
end

return _xx1