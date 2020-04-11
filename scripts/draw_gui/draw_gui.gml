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

/// Config Font
draw_set_font(_font)
draw_set_color(_color)
draw_set_alpha(_alpha)
draw_set_valign(_av)
draw_set_halign(_ah)

/// Posicionar
_xx = gui_get_x_align(_xx, _ah)
_yy = gui_get_y_align(_yy, _av)

#region DRAW GUI
if game.app.render.font_hd begin
	gpu_set_texfilter(true)
	draw_text_transformed(_xx, _yy, _text, _size, _size, 0)
	gpu_set_texfilter(false)
end
else begin 
	draw_text_transformed(_xx, _yy, _text, _size, _size, 0)
end
#endregion