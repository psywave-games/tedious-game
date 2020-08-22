/// @arg0 menuId
/// @arg1 Text
/// @arg2 OPTIONAL_x
/// @arg3 OPTIONAL_y
/// @arg4 OPTIONAL_color

var _xx = 10
var _yy = 30
var _id = argument[0]
var _text = argument[1]
var _color = c_white

#region PERSONALIZADO
if argument_count > 2 begin
	_xx = argument[2]
end
if argument_count > 3 begin
	_yy = argument[3]
end
if argument_count > 4 begin
	_color = argument[4]
end
#endregion	

_yy += 30 * _id

var _alpha = game.app.interface.select == _id? 1: 0.5


_xx = gui_get_x_align(_xx, fa_left)
_yy = gui_get_y_align(_yy, fa_middle)

draw_set_text_config( fnt_game0, _color, _alpha, fa_left, fa_middle)
draw_text_hd(_xx, _yy, _text, 1.0)
mouse_select(_xx, _yy, _text, _id)