#region GAMEPAD INPUTS
var _gamepad_up = false
var _gamepad_down = false
var _gamepad_left = false
var _gamepad_right = false

var _gamepaded_cross = false
var _gamepaded_circle = false
var _gamepaded_square = false
var _gamepaded_triangle = false
var _gamepaded_zl = false
var _gamepaded_zr = false
var _gamepaded_start = false

var _gamepaded_up = false
var _gamepaded_down = false
var _gamepaded_left = false
var _gamepaded_right = false

var _gamepad_axis_m = false
var _gamepad_axis_x = 0
var _gamepad_axis_y = 0

if self.suport_gamepad begin

	_gamepaded_up = gamepad_button_check_pressed(gamepad, gp_padu)
	_gamepaded_down = gamepad_button_check_pressed(gamepad, gp_padd)
	_gamepaded_left = gamepad_button_check_pressed(gamepad, gp_padl)
	_gamepaded_right = gamepad_button_check_pressed(gamepad, gp_padr)

	_gamepad_up = gamepad_button_check(gamepad, gp_padu)
	_gamepad_down = gamepad_button_check(gamepad, gp_padd)
	_gamepad_left = gamepad_button_check(gamepad, gp_padl)
	_gamepad_right = gamepad_button_check(gamepad, gp_padr)
	
	_gamepaded_cross = gamepad_button_check_pressed(gamepad, gp_face1)
	_gamepaded_circle = gamepad_button_check_pressed(gamepad, gp_face2)
	_gamepaded_square = gamepad_button_check_pressed(gamepad, gp_face3)
	_gamepaded_triangle = gamepad_button_check_pressed(gamepad, gp_face4)
	_gamepaded_zl = gamepad_button_check_pressed(gamepad, gp_shoulderlb)
	_gamepaded_zr = gamepad_button_check_pressed(gamepad, gp_shoulderrb)
	_gamepaded_start = gamepad_button_check_pressed(gamepad, gp_start) 
	_gamepaded_start|= gamepad_button_check_pressed(gamepad, gp_select)
	
	_gamepad_axis_m = gamepad_button_check(gamepad, gp_stickl)
	
	var ax = gamepad_axis_value(gamepad, gp_axislh)
	var ay = gamepad_axis_value(gamepad, gp_axislv)
	
	_gamepad_axis_x = abs(ax) <= 0.1? 0: sign(ax)
	_gamepad_axis_y = abs(ay) <= 0.3? 0: sign(ay)
end
#endregion

#region KEYBOARD INPUTS
var _msed_left = mouse_check_button_pressed(mb_left)
var _msed_right = mouse_check_button_pressed(mb_right)

var _keyd_enter = keyboard_check_pressed(vk_enter)
var _keyd_esc = keyboard_check_pressed(vk_escape)
var _keyd_del = keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(vk_delete)

var _keyd_ord_f = keyboard_check_pressed(ord("F"))
var _keyd_ord_q = keyboard_check_pressed(ord("Q"))
var _keyd_ord_e = keyboard_check_pressed(ord("E"))
var _keyd_ord_w = keyboard_check_pressed(ord("W"))
var _keyd_ord_a = keyboard_check_pressed(ord("A"))
var _keyd_ord_s = keyboard_check_pressed(ord("S"))
var _keyd_ord_d = keyboard_check_pressed(ord("D"))

var _key_ord_w = keyboard_check(ord("W"))
var _key_ord_a = keyboard_check(ord("A"))
var _key_ord_s = keyboard_check(ord("S"))
var _key_ord_d = keyboard_check(ord("D"))
var _key_ord_m = keyboard_check(ord("M"))

var _keyd_up = keyboard_check_pressed(vk_up) or _keyd_ord_w
var _keyd_left = keyboard_check_pressed(vk_left) or _keyd_ord_a 
var _keyd_down = keyboard_check_pressed(vk_down) or _keyd_ord_s
var _keyd_righ = keyboard_check_pressed(vk_right) or _keyd_ord_d
//var _keyd_space = keyboard_check_pressed(vk_space)

var _key_up = keyboard_check(vk_up) or _key_ord_w
var _key_left = keyboard_check(vk_left) or _key_ord_a
var _key_down = keyboard_check(vk_down) or _key_ord_s
var _key_righ = keyboard_check(vk_right) or _key_ord_d
var _key_shift = keyboard_check(vk_shift)
var _key_enter = keyboard_check(vk_enter)

var _mouse_axis = 0

if self.hover then
	_mouse_axis = _msed_left - _msed_right
	
#endregion

key_menu_open = false
key_menu_esc = false
key_menu_enter = false
key_axis_x = 0
key_axis_y = 0
key_menu_go = 0
key_menu_in = 0
hover = game.app.interface.hover

#region MENUS
if game.app.state == fsm_game.intro begin 
	key_menu_open = _keyd_enter + _msed_left
end 

else if game.app.state == fsm_game.play begin
	key_menu_open = _keyd_esc
end

else if game.app.state == fsm_game.videogamePlay begin
	key_menu_esc = _keyd_esc
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
	or game.app.state == fsm_game.menuWindow
	or game.app.state == fsm_game.videogameMenu begin
	
	key_menu_esc = _keyd_esc
	key_menu_enter = _keyd_enter
	key_menu_go = _keyd_down - _keyd_up
	key_menu_in = _keyd_righ - _keyd_left + _keyd_enter + _mouse_axis
end

else if game.app.state == fsm_game.videogameMain begin
	key_menu_esc = _keyd_esc
	key_menu_enter = _keyd_enter + _mouse_axis
	key_menu_go = _keyd_righ - _keyd_left + (_keyd_down - _keyd_up) * 3
end

else if game.app.state == fsm_game.lang begin 
	key_menu_go = _keyd_righ - _keyd_left 
	key_menu_in = _keyd_enter + _mouse_axis
end

else if game.app.state == fsm_game.warn then
	key_menu_in = _keyd_del
	
else if game.app.state == fsm_game.waitFocus then
	key_menu_in = _msed_left or _msed_right
	
else if game.app.state == fsm_game.menuTutorial begin
	key_menu_esc = _keyd_esc or _keyd_enter
end
#endregion

#region GAMEPLAY

if game.app.state == fsm_game.play begin
	key_axis_x = _key_righ - _key_left
	key_axis_y = _key_down - _key_up
	key_axis_switch = _keyd_ord_e - _keyd_ord_q

	key_run = _key_shift 
	key_moonwalk = _key_ord_m
	key_interact = _keyd_enter or _keyd_ord_f
	
	if game.app.input.suport_gamepad begin 
		key_axis_x += _gamepad_right - _gamepad_left
		key_axis_x += _gamepad_axis_x
		key_axis_y += _gamepad_axis_y
		key_axis_y += _gamepad_down - _gamepad_up
		key_axis_switch += _gamepaded_triangle - _gamepaded_square
		key_axis_switch += _gamepaded_zr - _gamepaded_zl
		
		key_run |= _gamepaded_circle
		key_interact |= _gamepaded_cross
		key_moonwalk |= _gamepad_axis_m
	end
end
#endregion

#region VIDEOGAME
if  game.app.state == fsm_game.videogamePlay begin
	key_axis_x = _key_righ - _key_left
	key_axis_y = _key_up - _key_down 
	key_fire = _keyd_ord_f
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
	else if keyboard_check_pressed(vk_numpad0) then key_input_text = "0"
	else if keyboard_check_pressed(vk_numpad0) then key_input_text = "1"
	else if keyboard_check_pressed(vk_numpad0) then key_input_text = "2"
	else if keyboard_check_pressed(vk_numpad0) then key_input_text = "3"
	else if keyboard_check_pressed(vk_numpad0) then key_input_text = "4"
	else if keyboard_check_pressed(vk_numpad0) then key_input_text = "5"
	else if keyboard_check_pressed(vk_numpad0) then key_input_text = "6"
	else if keyboard_check_pressed(vk_numpad0) then key_input_text = "7"
	else if keyboard_check_pressed(vk_numpad0) then key_input_text = "8"
	else if keyboard_check_pressed(vk_numpad0) then key_input_text = "9"
	else key_input_text = "NONE"
end
#endregion