/// @arg0 x
/// @arg1 align
/// @arg2 OPTIONAL_padding

var _xx = argument[0]
var _ah = argument[1]
var _padding = argument_count > 2? argument[2]: padding

#region Enquadramento
var _min_x = _padding
var _max_x = display_get_gui_width() - _padding
#endregion

#region Posicionamento Horizontal
switch _ah begin 
	case fa_left:
		_xx += _min_x
		break
		
	case fa_right: 
		_xx = _max_x - _xx
		break
		
	case fa_center:
		_xx += display_get_gui_width() / 2
end
#endregion

return clamp(_xx, _min_x, _max_x)