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

_xx = gui_get_x_align(_xx, _ah)
_yy = gui_get_x_align(_yy, _av)


draw_sprite_ext(_sprite, _image_index, _xx, _yy, _size, _size, 0, _color, _alpha)