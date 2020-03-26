/// @description Insert description here
// You can write your code in this editor
var _msed_left = mouse_check_button_pressed(mb_left)
var _msed_right = mouse_check_button_pressed(mb_right)

var _keyd_enter = keyboard_check_pressed(vk_enter)
var _keyd_esc = keyboard_check_pressed(vk_escape)
var _keyd_del = keyboard_check_pressed(vk_backspace)

var _keyd_ord_f = keyboard_check_pressed(ord("F"))
var _keyd_ord_q = keyboard_check_pressed(ord("Q"))
var _keyd_ord_e = keyboard_check_pressed(ord("E"))

var _keyd_up = keyboard_check_pressed(vk_up)
var _keyd_left = keyboard_check_pressed(vk_left)
var _keyd_down = keyboard_check_pressed(vk_down)
var _keyd_righ = keyboard_check_pressed(vk_right)
var _keyd_space = keyboard_check_pressed(vk_space)

var _key_up = keyboard_check(vk_up)
var _key_left = keyboard_check(vk_left)
var _key_down = keyboard_check(vk_down)
var _key_righ = keyboard_check(vk_right)
var _key_shift = keyboard_check(vk_shift)
var _key_ord_m = keyboard_check(ord("M"))

#region MENUS
key_menu_open = false
key_menu_esc = false
key_menu_go = 0
key_menu_in = 0

if game.app.state == fsm_game.intro begin 
	key_menu_open = _keyd_enter
end 

else if game.app.state == fsm_game.play begin
	key_menu_open = _keyd_esc
end

else if game.app.state == fsm_game.cutscene begin
	key_menu_open = _keyd_esc
end

else if game.app.state == fsm_game.menuMain 
	or game.app.state == fsm_game.menuOptions
	or game.app.state == fsm_game.menuGraphic 
	or game.app.state == fsm_game.menuAudio
	or game.app.state == fsm_game.menuWindow begin 
	
	key_menu_esc = _keyd_esc
	key_menu_enter = _keyd_enter
	key_menu_go = _keyd_down - _keyd_up
	key_menu_in = _keyd_righ - _keyd_left + _keyd_enter - _msed_left + _msed_right
end

else if game.app.state == fsm_game.lang begin 
	key_menu_go = _keyd_righ - _keyd_left 
	key_menu_in = _keyd_enter + _msed_left - _msed_right
end

else if game.app.state == fsm_game.warn then
	key_menu_in = _keyd_del

#endregion

#region GAMEPLAY

key_axis_x = 0
key_axis_y = 0

if game.app.state = fsm_game.play begin
	key_axis_x = _key_righ - _key_left
	key_axis_y = _key_down - _key_up
	key_axis_switch = _keyd_ord_e - _keyd_ord_q

	key_run = _key_shift 
	key_jump = _keyd_space
	key_moonwalk = _key_ord_m
	key_interact = _keyd_enter or _keyd_ord_f
end


#endregion
