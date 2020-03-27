/// @description Insert description here
// You can write your code in this editor
var _msed_left = mouse_check_button_pressed(mb_left)
var _msed_right = mouse_check_button_pressed(mb_right)

var _keyd_enter = keyboard_check_pressed(vk_enter)
var _keyd_esc = keyboard_check_pressed(vk_escape)
var _keyd_del = keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(vk_delete)

var _keyd_ord_f = keyboard_check_pressed(ord("F"))
var _keyd_ord_q = keyboard_check_pressed(ord("Q"))
var _keyd_ord_e = keyboard_check_pressed(ord("E"))

var _keyd_up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
var _keyd_left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
var _keyd_down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))
var _keyd_righ = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))
var _keyd_space = keyboard_check_pressed(vk_space)

var _key_up = keyboard_check(vk_up)
var _key_left = keyboard_check(vk_left)
var _key_down = keyboard_check(vk_down)
var _key_righ = keyboard_check(vk_right)
var _key_shift = keyboard_check(vk_shift)
var _key_ord_m = keyboard_check(ord("M"))
var _key_enter = keyboard_check(vk_enter)

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

else if game.app.state == fsm_game.over begin
	key_menu_open = _keyd_esc
end

else if game.app.state == fsm_game.credits begin
	key_menu_open = _keyd_esc
	key_menu_enter = _key_enter
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

#region INPUTEXT GAMEOVER
if game.app.state == fsm_game.over begin
	key_menu_delete = _keyd_del
	key_menu_enter = _keyd_enter
	
	if keyboard_check_pressed(ord("A")) then key_input_text = "a"
	else if keyboard_check_pressed(ord("B")) then key_input_text = "b"
	else if keyboard_check_pressed(ord("C")) then key_input_text = "c"
	else if keyboard_check_pressed(ord("D")) then key_input_text = "d"
	else if keyboard_check_pressed(ord("E")) then key_input_text = "e"
	else if keyboard_check_pressed(ord("F")) then key_input_text = "f"
	else if keyboard_check_pressed(ord("G")) then key_input_text = "g"
	else if keyboard_check_pressed(ord("H")) then key_input_text = "h"
	else if keyboard_check_pressed(ord("I")) then key_input_text = "i"
	else if keyboard_check_pressed(ord("J")) then key_input_text = "j"
	else if keyboard_check_pressed(ord("K")) then key_input_text = "k"
	else if keyboard_check_pressed(ord("L")) then key_input_text = "l"
	else if keyboard_check_pressed(ord("M")) then key_input_text = "m"
	else if keyboard_check_pressed(ord("N")) then key_input_text = "n"
	else if keyboard_check_pressed(ord("O")) then key_input_text = "o"
	else if keyboard_check_pressed(ord("P")) then key_input_text = "p"
	else if keyboard_check_pressed(ord("Q")) then key_input_text = "q"
	else if keyboard_check_pressed(ord("R")) then key_input_text = "r"
	else if keyboard_check_pressed(ord("S")) then key_input_text = "s"
	else if keyboard_check_pressed(ord("T")) then key_input_text = "t"
	else if keyboard_check_pressed(ord("U")) then key_input_text = "u"
	else if keyboard_check_pressed(ord("V")) then key_input_text = "v"
	else if keyboard_check_pressed(ord("W")) then key_input_text = "w"
	else if keyboard_check_pressed(ord("X")) then key_input_text = "x"
	else if keyboard_check_pressed(ord("Y")) then key_input_text = "y"
	else if keyboard_check_pressed(ord("Z")) then key_input_text = "z"
	else if keyboard_check_pressed(vk_space) then key_input_text = " "
	else key_input_text = "NONE"
end
#endregion