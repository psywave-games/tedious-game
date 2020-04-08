/// @arg0 menuId
/// @arg1 Text
/// @arg2 OPTIONAL_x
/// @arg3 OPTIONAL_y
/// @arg6 OPTIONAL_color

var _xx = 10
var _yy = 30 
var _horizontal = fa_left
var _vertical = fa_middle
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

_yy += 30 * argument[0]

var _alpha = game.app.interface.select == argument[0]? 1: 0.5

draw_gui(_xx, _yy, _horizontal, _vertical, argument[1], fnt_game0, _color, _alpha)

