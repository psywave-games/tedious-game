/// @arg0 menuId
/// @arg1 Text
/// @arg2 OPTIONAL_x
/// @arg3 OPTIONAL_y
/// @arg4 OPTIONAL_vertical
/// @arg5 OPTIONAL_horizontal

var _xx = 10
var _yy = 30 
var _horizontal = fa_left
var _vertical = fa_middle

#region PERSONALIZADO
if argument_count > 2 begin
	_xx = argument[2]
end
if argument_count > 3 begin
	_yy = argument[3]
end

if argument_count > 4 begin
	_horizontal = argument[4]
end
if argument_count > 5 begin
	_vertical = argument[5]
end
#endregion	

_yy += 30 * argument[0]

var _alpha = game.app.interface.select == argument[0]? 1: 0.5

draw_gui(_xx, _yy, _horizontal, _vertical, argument[1], fnt_game0, 15, _alpha)

