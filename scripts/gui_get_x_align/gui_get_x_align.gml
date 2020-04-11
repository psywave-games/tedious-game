/// @arg0 x
/// @arg1 align

var _xx = argument0
var _ah = argument1

#region Enquadramento
var min_x = padding
var max_x = display_get_gui_width() - padding
#endregion

#region Posicionamento Horizontal
switch _ah begin 
	case fa_left:
		_xx += min_x
		break
		
	case fa_right: 
		_xx = max_x - _xx
		break
		
	case fa_center:
		_xx += display_get_gui_width() / 2
end
#endregion

return clamp(_xx, min_x, max_x)