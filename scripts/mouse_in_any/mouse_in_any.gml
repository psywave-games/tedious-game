var _xx_max = display_get_gui_width()
var _yy_max = display_get_gui_height()

for (var mouse = 0; mouse <= 5; mouse++) begin
	var _xx = device_mouse_x_to_gui(mouse)
	var _yy = device_mouse_y_to_gui(mouse)
	
	if point_in_rectangle(_xx, _yy, 0, 0, _xx_max, _yy_max)
		break
		
	if mouse == 5 then
		return false
end

if os_device == os_winphone then 
	return true
	
if os_device == os_android then 
	return true
	
if os_device == os_switch then 
	return true
	
if os_device == os_ios then 
	return true
	
if mouse_check_button(mb_left) then
	return true
	
return false