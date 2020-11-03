/// @description draw_controllers

/// reset controllers
internal_old_buttons = internal_new_buttons
internal_new_buttons = 0
internal_analog_dpad = 0
internal_analog_axis_x = 0
internal_analog_axis_y = 0

#region DISABLE SCREEN TOUTCH BUTTONS
if game.app.render.mode_ratio != 0 then 
	exit

if not screen then
	exit
	
if game.app.render.resolution <= 640
	and game.app.state != fsm_game.play
	and game.app.state != fsm_game.insider then 
		exit
#endregion

draw_set_alpha(1.0)
var _press = mouse_check_button(mb_any)
var _vw = display_get_gui_width()
var _vh = display_get_gui_height()
var _vhm = _vh/2
var _mh = _vhm + _vhm/2
var _h = _vh/64
var _w = _vw/6

draw_set_color(button_color_background)
draw_rectangle(0, _vhm, _vw, _vh, false)

draw_set_color(c_black)
draw_line_width(0, _vhm, _vw, _vhm, 4)

internal_new_buttons += _press * 512 * draw_btn2(_vw/2, _vh/2 + _h * 3, make_color_rgb(91,106,120), "start")
internal_new_buttons += _press * 8 * draw_btn(gui_get_x_align(_w * 0.5, fa_right), _mh - _h * 1, make_color_rgb(222,185,50))
internal_new_buttons += _press * 2 * draw_btn(gui_get_x_align(_w * 1.5, fa_right), _mh - _h * 0, make_color_rgb(189,91,76))
internal_new_buttons += _press * 4 * draw_btn(gui_get_x_align(_w * 2.5, fa_right), _mh + _h * 1, make_color_rgb(119,130,188))
internal_new_buttons += _press * 1 * draw_analog(padding + (_w * 1.25), _mh + _h * 1)
internal_old_buttons |= internal_new_buttons >> 0 & 1 /// botão verde não pode ser pressed