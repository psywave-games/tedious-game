/// @arg0 y
/// @arg1 align

var _yy = argument0
var _av = argument1

#region Enquadramento
var min_y = padding
var max_y = display_get_gui_height() - padding
#endregion

#region Posicionamento Vertical
switch _av begin 
	case fa_top:
		_yy += min_y
		break
		
	case fa_bottom: 
		_yy = max_y - _yy
		break
		
	case fa_middle:
		_yy += display_get_gui_height() / 2
		break
end
#endregion

return clamp(_yy, min_y, max_y)