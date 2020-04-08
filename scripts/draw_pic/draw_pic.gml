/// @arg0 sprite_index
/// @arg1 image_index
/// @arg2 x
/// @arg3 y
/// @arg4 align horizontal
/// @arg5 align vertical
/// @arg6 colorId
/// @arg7 OPTIONAL_alpha
/// @arg8 OPTIONAL_size

#region LOAD ARGUMENTS
var _sprite = argument[0]
var _image_index = argument[1] 
var _xx = argument[2]
var _yy = argument[3] 
var _ah = argument[4] 
var _av = argument[5] 
var _color = argument[6]
var _alpha = argument_count > 7? argument[7]: 1
var _size = argument_count > 8? argument[8]: 1
var _padding = 10
#endregion

#region Config Gui
draw_set_valign(_av)
draw_set_halign(_ah)
#endregion



#region Enquadramento
var min_x = _padding
var min_y = _padding
var max_x = display_get_gui_width() + min_x - ( _padding  * 2 )
var max_y = display_get_gui_height() + min_y - ( _padding * 2 )
#endregion


#region Posicionamento Vertical
switch _ah begin 
	case fa_left:
		_xx += min_x
		break
		
	case fa_right: 
		_xx = max_x - _xx
		break
		
	case fa_center:
		_xx += (min_x + max_x) / 2
end
#endregion

#region Posicionamento Horizontal
switch _av begin 
	case fa_top:
		_yy += min_y
		break
		
	case fa_bottom: 
		_yy = max_y - _yy
		break
		
	case fa_middle:
		_yy += (min_y + max_y) / 2
end
#endregion

/// Limitar na tela
_xx = clamp(_xx, min_x, max_x)
_yy = clamp(_yy, min_y, max_y)


draw_sprite_ext(_sprite, _image_index, _xx, _yy, _size, _size, 0, _color, _alpha)