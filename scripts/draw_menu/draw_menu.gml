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

#region MOUSE HOVER
/*
/// posicao do mouse
var _mouse_x = window_mouse_get_x() + window_get_x()
var _mouse_y = window_mouse_get_y() + window_get_y()

/// centro da tela
var _w = display_get_gui_width()/2 
var _h = display_get_gui_height()/2

/// SELECAO IDIOMAS
if game.app.state == fsm_game.lang begin
	if point_distance(_mouse_x, _mouse_y, _w, _h) <= (_w+_h)/5 then 
		game.app.interface.select = _w <= _mouse_x
end 
/// MENUS
else begin 
	/// get menu y
	var _menu_xx = _w + _xx
	var _menu_yy = _h + _yy
	
	if abs( _menu_yy - _mouse_y + 5) <= 16 and _mouse_x <= _menu_xx then
		game.app.interface.select = argument[0]
end
*/
#endregion

var _alpha = game.app.interface.select == argument[0]? 1: 0.5

draw_gui(_xx, _yy, _horizontal, _vertical, argument[1], fnt_game0, c_white, _alpha)

