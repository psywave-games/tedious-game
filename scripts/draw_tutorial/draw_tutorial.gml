/// @description textbox action with button collor
/// @arg0 color
/// @arg1 text
/// @arg2 id
/// @arg3 size

draw_set_text_config( fnt_game0, make_color_rgb(62, 70, 80), 1.4, fa_center, fa_middle)

var _resolution = game.app.render.size_resolution[game.app.render.mode_resolution]
var _lite = game.app.render.mode_ratio == 0 or lite()
var _mini = _resolution <= 640 or _lite or (ratio_get() == 1.0 and _resolution < 900)
var _color_1 = is_array(argument0)? argument0[0]: argument0
var _color_2 = is_array(argument0)? argument0[1]: argument0
var _text = argument1
var _id = argument2
var _size = argument3
var _padding = padding * _size
var _size_w = (string_width("interagir") * _size) + (padding * 2)
var _size_h = (string_height(argument1) * _size) + (padding * 2)
var _margin = _lite? 32: 100
var _yy = _resolution <= 640 and not _lite? 300: display_get_gui_height() - _margin - padding
var _xx = 0x0

#region POS
switch _id begin
	case 0:
		_xx = gui_get_x_align((_padding * 2) + _size_w, fa_left)
		break
		
	case 1:
		if _mini begin
			_yy -= _size_h/2 + (_margin * _size)
			_xx = gui_get_x_align((_padding * 2) + _size_w, fa_left)
		end
		else
			_xx = gui_get_x_align(((_padding * 2) + _size_w) * -1, fa_middle)
		break
		
	case 2:
		if _mini begin
			_yy -= _size_h/2 + (_margin * _size)
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

if not _lite begin
	draw_rectangle(
		_xx - _size_w,
		_yy - _size_h,
		_xx + _size_w,
		_yy + _size_h,
		false
	)
end

draw_set_color(_color_1)
draw_circle(_xx + (_padding*2) - _size_w, _yy, _padding, false)

if _color_1 != _color_2 begin
	draw_set_color(_color_2)
	draw_circle(_xx + (_padding*5) - _size_w, _yy, _padding, false)
end

draw_set_color(c_white)
draw_text_hd(_xx, _yy, _text, _size)