/// @arg0 x
/// @arg1 y
/// @arg2 color
/// @arg3 text
var _xx = argument0
var _yy = argument1
var _color = argument2
var _text = argument3
var _size = sqrt(display_get_gui_height() * display_get_gui_width())/16
var _xx0 = _xx - _size * 2
var _yy0 = _yy - _size / 2 
var _xx1 = _xx + _size * 2
var _yy1 = _yy + _size / 2
var _pressed = mouse_in_rectangle(_xx0, _yy0, _xx1, _yy1)

draw_set_color(_color)
draw_set_alpha(_pressed?0.64:1.0)
draw_rectangle(_xx0, _yy0, _xx1, _yy1, false)

draw_set_text_config(fnt_game1, make_color_rgb(62, 70, 80), 1.0, fa_center, fa_middle)
draw_text_transformed(_xx, _yy, _text, _size/32, _size/32, 0.0)

draw_set_color(c_black)
draw_set_alpha(1.0000)
draw_rectangle(_xx0, _yy0, _xx1, _yy1, true)

return _pressed