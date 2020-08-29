/// @arg0 y
/// @arg1 align
/// @arg2 OPTIONAL_padding

var _yy = argument[0]
var _av = argument[1]
var _padding = argument_count > 2? argument[2]: padding

var _vw = display_get_gui_width()
var _vh = display_get_gui_height()

#region Enquadramento
var _min_y = _padding
var _max_y = _vh > _vw? (_vh/2) - _padding: _vh - _padding
#endregion

#region Posicionamento Vertical
switch _av begin 
	case fa_top:
		_yy += _min_y
		break
		
	case fa_bottom: 
		_yy = _max_y - _yy
		break
		
	case fa_middle:
		_yy += (_min_y+_max_y)/2
		break
end
#endregion

return clamp(_yy, _min_y, _max_y)