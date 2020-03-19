/// @arg0 x
/// @arg1 y
/// @arg2 align horizontal
/// @arg3 align vertical
/// @arg4 text
/// @arg5 font
/// @arg6 colorId
/// @arg7 alpha
/// @arg8 OPTIONAL_size

#region LOAD ARGUMENTS
var _xx = argument[0]
var _yy = argument[1] 
var _ah = argument[2] 
var _av = argument[3] 
var _text = argument[4] 
var _font = argument[5]
var _alpha = argument[7]
var _color = 0xFFFFFF//game.app.color[argument[6]]
var _padding = 10
var _size = argument_count > 8? argument[8]: 0.2
#endregion

#region Config Gui
draw_set_font(_font)
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


#region DRAW GUI
if true begin
	gpu_set_texfilter(true)
	draw_text_transformed_color(_xx,_yy, _text, _size, _size, 0, _color, _color, _color, _color, _alpha)
	gpu_set_texfilter(false)
end
else begin 
	draw_text_transformed_color(_xx,_yy, _text, _size, _size, 0, _color, _color, _color, _color, _alpha)
end
#endregion

