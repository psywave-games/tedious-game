/// @arg0 x
/// @arg1 y
/// @arg2 text
/// @arg3 size

var _xx = argument0
var _yy = argument1
var _text = argument2
var _size = argument3

if game.app.render.mode_font_hd and not lite() begin
	gpu_set_texfilter(true)
	draw_text_transformed(_xx, _yy, _text, _size, _size, 0)
	gpu_set_texfilter(false)
	exit
end

draw_text_transformed(_xx, _yy, _text, _size, _size, 0)