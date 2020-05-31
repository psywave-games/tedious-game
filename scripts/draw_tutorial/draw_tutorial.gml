/// @description textbox action with button collor
/// @arg0 color
/// @arg1 text
/// @arg2 id

draw_set_text_config( fnt_game0, make_color_rgb(62, 70, 80), 1.4, fa_center, fa_middle)

var _mobile = ratio_get() <= 1
var _color_1 = is_array(argument0)? argument0[0]: argument0
var _color_2 = is_array(argument0)? argument0[1]: argument0
var _text = argument1
var _id = argument2
var _padding = 10
var _size_w = string_width("interagir") + (_padding * 2)
var _size_h = string_height(argument1) + (_padding * 2)
var _yy = display_get_gui_height() - padding - 100
var _xx = 0x0

#region POS
switch _id begin
	case 0:
		_xx = gui_get_x_align((_padding * 2) + _size_w, fa_left)
		break
		
	case 1:
		if _mobile begin
			_yy -= 100
			_xx = gui_get_x_align((_padding * 2) + _size_w, fa_left)
		end
		else
			_xx = gui_get_x_align(((_padding * 2) + _size_w) * -1, fa_middle)
		break
		
	case 2:
		if _mobile begin
			_yy -= 100
			_xx = gui_get_x_align((_padding * 2) + _size_w, fa_right)
		end
		else
			_xx = gui_get_x_align((_padding * 2) + _size_w, fa_middle)
		break
		
	case 3:
		_xx = gui_get_x_align((_padding * 2) + _size_w, fa_right)
		break
end
#endregion

draw_rectangle(
	_xx - _size_w,
	_yy - _size_h,
	_xx + _size_w,
	_yy + _size_h,
	false
)

draw_set_color(_color_1)
draw_circle(_xx + (_padding*2) - _size_w, _yy, _padding, false)

if _color_1 != _color_2 begin
	draw_set_color(_color_2)
	draw_circle(_xx + (_padding*5) - _size_w, _yy, _padding, false)
end

draw_set_color(c_white)
draw_text(_xx, _yy, _text)