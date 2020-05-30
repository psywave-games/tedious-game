/// @descripition fade float
/// @arg0 step
/// @arg1 init
/// @arg2 end
/// @arg3 size

var _step = argument0
var _init = argument1
var _end = argument2 - argument3
var _size = argument3

if _step < _init + _size then
	return anim_fadein(_step, _init, _size)
	
else if _step > _end then
	return anim_fadeout(_step, _end, _size)
	
return 0.0