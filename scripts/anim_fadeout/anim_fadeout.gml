/// @descripition fade float
/// @arg0 step
/// @arg1 init
/// @arg2 size

var _step = (argument0 - argument1)
var _size = argument2

if _step <= 0 then
	return 0
	
if _step > _size then
	return 1

return 1 - ( (_size - _step)/_size )