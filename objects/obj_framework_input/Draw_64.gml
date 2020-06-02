/// @description draw_controllers

var _ww = window_get_width()
var _wh = window_get_height()
var _vw = display_get_gui_width()
var _vh = display_get_gui_height()
var _rt = ratio_get()
var _mobile = _wh >_ww

internal_old_buttons = internal_new_buttons
internal_new_buttons = 0

if _mobile begin
	draw_set_color(make_color_rgb(62, 70, 80))
	draw_set_alpha(1.0)
	draw_rectangle(0, (_vh * _rt) - padding, _vw, _vh, false)
	var _mh = _vh/2 + _vh/4
	var _h = _vh/64
	var _w = _vw/6
	
	internal_new_buttons += 8 * draw_btn(gui_get_x_align(_w*0.5, fa_right), _mh - _h * 3, make_color_rgb(222,185,50))
	internal_new_buttons += 2 * draw_btn(gui_get_x_align(_w*1.5, fa_right), _mh - _h * 2, make_color_rgb(189,91,76))
	internal_new_buttons += 4 * draw_btn(gui_get_x_align(_w*2.5, fa_right), _mh - _h * 1, make_color_rgb(119,130,188))
	internal_new_buttons += 1 * draw_analog(padding + (_w*1.0), _mh - _h * 1)
	internal_old_buttons |= internal_new_buttons >> 0 & 1 /// botão verde não pode ser pressed
	
	if game.app.state != fsm_game.menuTutorial then
		internal_new_buttons += 512 * draw_btn2(_vw/2, _vh - _h * 4, make_color_rgb(91,106,120), "start")
end