/// @arg0 x
/// @arg1 y
/// @arg2 align horizontal
/// @arg3 align vertical
/// @arg4 text
/// @arg5 font
/// @arg6 colorId
/// @arg7 alpha
/// @arg8 OPTIONAL_size

var _xx = argument[0]
var _yy = argument[1] 
var _ah = argument[2] 
var _av = argument[3] 
var _text = argument[4] 
var _font = argument[5]
var _color = argument[6]
var _alpha = argument[7]
var _size = argument_count > 8? argument[8]: 1

_xx = gui_get_x_align(_xx, _ah)
_yy = gui_get_y_align(_yy, _av)

draw_set_text_config( _font, _color, _alpha, _ah, _av)
draw_text_hd(_xx, _yy, _text, _size)