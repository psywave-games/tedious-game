/// @arg0 y
/// @arg1 align
/// @arg2 OPTIONAL_padding

var _yy = argument[0]
var _av = argument[1]
var _padding = argument_count > 2? argument[2]: padding

var _ww = window_get_width()
var _wh = window_get_height()
var _vh = display_get_gui_height()

#region Enquadramento
var min_y = _padding
var max_y = _wh > _ww? (_vh*ratio_get()) - (_padding*2): _vh - _padding
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
		_yy += max_y/2
		break
end
#endregion

return clamp(_yy, min_y, max_y)