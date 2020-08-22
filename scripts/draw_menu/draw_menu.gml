/// @arg0 menuId
/// @arg1 text
/// @arg2 OPTIONAL_type
/// @arg3 OPTIONAL_value
/// @arg4 OPTIONAL_description
/// @arg5 OPTIONAL_color
/// @arg6 OPTIONAL_align_horizontal
/// @arg7 OPTIONAL_align_vertical
/// @arg8 OPTIONAL_x
/// @arg9 OPTIONAL_y
/// @arg10 OPTIONAL_width
/// @arg11 OPTIONAL_height

#region PARAMS
var _menu = argument[0]
var _text = argument[1]
var _type = argument_count > 2? argument[2]: button_type_normal
var _value = argument_count > 3? argument[3]: 0
var _description = argument_count > 4? argument[4]: ""
var _color = argument_count > 5? argument[5]: button_color_text
var _ah = argument_count > 6? argument[6]: button_default_ah
var _av = argument_count > 7? argument[7]: button_default_vh
var _xx = argument_count > 8? argument[8]: 0
var _yy = argument_count > 9? argument[9]: 0
var _width = argument_count > 10? argument[10]: button_menu_width
var _height = argument_count > 11? argument[11]: button_menu_height
var _alpha = game.app.interface.select == _menu? button_alpha_normal: button_alpha_hover
#endregion
#region POSITION
/// ajustar posicão conforme menus anteriores e align
_xx = gui_get_x_align(_xx, _ah, button_menu_margin)
_yy = gui_get_y_align(_yy + (_menu * (button_menu_padding + button_menu_height)), _av, button_menu_margin)

/// xx0|xx1|yy0|yy1 são posições de canto do retangulo
switch _ah begin
	case fa_left:
		var _xx0 = _xx
		var _xx1 = _xx + _width
		break
		
	case fa_right:
		var _xx0 = _xx - _width
		var _xx1 = _xx 
		break
		
	case fa_center:
		var _xx0 = _xx - _width/2
		var _xx1 = _xx + _width/2
		break
end
switch _av begin
	case fa_top:
		var _yy0 = _yy
		var _yy1 = _yy + _height
		break
		
	case fa_bottom:
		var _yy0 = _yy - _height
		var _yy1 = _yy 
		break
		
	case fa_middle:
		var _yy0 = _yy - _height/2
		var _yy1 = _yy + _height/2
		break
end

/// posição que ficara escrito o texto
_xx = (_xx0 + _xx1)/2
_yy = (_yy0 + _yy1)/2
#endregion
#region BACKGROUND DRAW
draw_set_color(button_color_background)
draw_set_alpha(_alpha)
draw_roundrect_ext(_xx0, _yy0, _xx1, _yy1, button_menu_round, button_menu_round, false)
#endregion 
#region DESCRIPTION DRAW
if string_length(_description) begin
	draw_set_font(button_font_description)
	draw_set_valign(fa_top)
	draw_set_halign(fa_center)
	draw_set_color(_color)

	draw_text_hd(_xx, _yy0, _description, 1 * font_size_description)
end
#endregion
#region TEXT|OPTIONS DRAW
draw_set_font(button_font_value)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_color(_color)

switch _type begin
	case button_type_bars:
		draw_set_font(fnt_bars)
		_text = string_repeat("l", _text) + string_repeat(".", 10 - _text)
	
	case button_type_options:
		draw_text_hd(_xx, _yy, _text, 1 * font_size_menu)
		var _left_arrow = is_array(_value)? bool(_value[0]): true
		var _right_arrow = is_array(_value)? bool(_value[1]): true
		if _right_arrow begin
			var _xx = _xx1 - _height/4
			draw_set_color(_color)
			draw_triangle(
				_xx, _yy,
				_xx + lengthdir_x(_height/1.8, 155),
				_yy + lengthdir_y(_height/1.8, 155),
				_xx + lengthdir_x(_height/1.8, 205),
				_yy + lengthdir_y(_height/1.8, 205),
				false
			)
			draw_set_color(button_color_background)
			draw_triangle(
				_xx - _height/3, _yy,
				_xx + lengthdir_x(_height/1.8, 155),
				_yy + lengthdir_y(_height/1.8, 155),
				_xx + lengthdir_x(_height/1.8, 205),
				_yy + lengthdir_y(_height/1.8, 205),
				false
			)
		end
		if _left_arrow begin
			var _xx = _xx0 + _height/4
			draw_set_color(_color)
			draw_triangle(
				_xx, _yy,
				_xx - lengthdir_x(_height/1.8, 155),
				_yy - lengthdir_y(_height/1.8, 155),
				_xx - lengthdir_x(_height/1.8, 205),
				_yy - lengthdir_y(_height/1.8, 205),
				false
			)
			draw_set_color(button_color_background)
			draw_triangle(
				_xx + _height/3, _yy,
				_xx - lengthdir_x(_height/1.8, 155),
				_yy - lengthdir_y(_height/1.8, 155),
				_xx - lengthdir_x(_height/1.8, 205),
				_yy - lengthdir_y(_height/1.8, 205),
				false
			)
		end
	
		break

	case button_type_check:
		draw_text_hd(_xx, _yy, _text, 1 * font_size_menu)
		draw_circle(_xx1 - _height/2, _yy, _height/4, false)
		draw_set_color(button_color_background)
		draw_circle(_xx1 - _height/2, _yy, _height/4.8, false)
		if bool(_value) begin
			draw_set_color(_color)
			draw_circle(_xx1 - _height/2, _yy, _height/8, false)
		end break

	default:
		draw_text_hd(_xx, _yy, _text, 1 * font_size_menu)
		break
end
#endregion

mouse_select2(_menu, _xx0, _yy0, _xx1, _yy1)