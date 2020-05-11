#region INTERFACE GUI GAMEPLAY
if game.app.state == fsm_game.play begin
	var _date = text_time(false) + "\n" + text_date("-")
	var _score_color = happy_sign < 0? c_red: c_white
	
	
	if self.can_interact then 
		draw_gui(0, 0, fa_left, fa_top, self.message, fnt_game0, c_white, 1.0, 1.4)
	draw_gui(0,0, fa_right, fa_bottom, text_build(), fnt_game0, c_white, 1, 1)
	draw_gui(0,0, fa_left, fa_bottom, _date, fnt_game0, c_white, 1, 1)
	draw_gui(0,0, fa_right, fa_top, text_score(), fnt_game0, _score_color, 1, 1.4)
	
	self.message = ""
end
#endregion

#region INTERFACE MENU LANG
else if game.app.state == fsm_game.lang begin
	var _xx = display_get_gui_width()/3
	var _yy = display_get_gui_height()/2
	var _pt = t(msg.pt)
	var _en = t(msg.en)
	
	draw_background(c_black, 1.0)
	
	mouse_select(gui_get_x_align(_xx, fa_left), _yy, _pt, 0)
	draw_gui(_xx, 0, fa_left, fa_middle, _pt, fnt_game0, c_white, select? 0.5: 1)
	
	mouse_select(gui_get_x_align(_xx, fa_right) - string_width(_en), _yy, _en, 1)
	draw_gui(_xx, 0, fa_right, fa_middle, _en, fnt_game0, c_white, select? 1: 0.5)
end
#endregion

#region INTERFACE WARNING
else if game.app.state == fsm_game.warn begin
	var xx = display_get_gui_width()/2
	var yy = display_get_gui_height()/2
	
	self.step += 1 
	draw_set_font(fnt_game1)
	draw_background(c_black, 1.0)
	
	/// PROSEGUIR
	if self.step > room_speed * 9 then
		state_reset(game.app, fsm_game.intro)
		
	/// AVISO
	else if self.step > room_speed * 3 begin
		draw_set_halign(fa_center)
		draw_set_valign(fa_top)
		
		draw_text_transformed_color(xx, -64, t(msg.warn_title), 8, 8, 0, c_red, c_red, c_red, c_red, 1)		
		draw_text_ext_transformed_color(xx, 160, t(msg.warn_text), 32, xx - 32, 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	end
	
	/// FAXETARIA
	else begin
		draw_sprite_ext(spr_esrb, 0, xx, yy, 1.2, 1.2, 0, c_white, 1)
		draw_set_halign(fa_left)
		draw_set_valign(fa_middle)
		draw_set_font(fnt_game1)
		draw_text_ext_transformed_color(xx - (xx/8), yy -40, t(msg.esrb), 16, yy, 2.4, 2.4, 0, c_black, c_black, c_black, c_black, 1)
	end
end	
#endregion

#region ANIMATION INTRO
else if game.app.state == fsm_game.intro begin
	
	draw_gui(0, 0, fa_right, fa_middle, t(msg.game_name), lite()? fnt_game0: fnt_title, c_white, 1, lite()? 2.6: 0.8)
	draw_gui(0, 100, fa_center, fa_bottom, t(msg.press_start), fnt_game0, c_white, current_second%2)
end
#endregion

#region INTERFACE MENU MAIN
else if game.app.state == fsm_game.menuMain begin
	
	draw_gui(0, 0, fa_right, fa_middle, t(msg.game_name), lite()? fnt_game0: fnt_title, c_white, 1, lite()? 2.6: 0.8)
	
	draw_menu(0, t(msg.menu_start))
	draw_menu(1, t(msg.menu_config))
	draw_menu(2, t(msg.menu_tutorial))
	draw_menu(3, t(msg.menu_exit), 10, 50)
end
#endregion

#region INTERFACE MENU OPTION
else if game.app.state == fsm_game.menuOptions begin
	var _gamepad = t(msg.psy_joystick) + " " + string(game.app.input.gamepad + 1)
	var _color_gamepad = gamepad_is_connected(game.app.input.gamepad)? c_white: c_red

	draw_menu(0, t(msg.menu_lang))
	draw_menu(1, t(msg.menu_gamepad))
	draw_menu(2, t(msg.menu_window))
	draw_menu(3, t(msg.menu_video))
	draw_menu(4, t(msg.menu_audio))
	draw_menu(5, t(msg.back), 10, 60)
	
	draw_item(0, t(game.app.lang), 200)
	draw_item(1, _gamepad, 200, 30, _color_gamepad)
end
#endregion

#region INTERFACE MENU DISPLAY
else if game.app.state == fsm_game.menuWindow begin

	var menu_resolution = string(display_get_gui_width()) + "x" + string(display_get_gui_height())
	var menu_proportion = game.app.render.name_ratio[game.app.render.mode_ratio]
	var menu_fullscreen = fullscreen_get()
	var menu_font_speed = game.app.render.font_speed
	var menu_cam_speed = game.app.render.mode_camera
	
	
	draw_menu(0, t(msg.video_size))
	draw_menu(1, t(msg.video_ratio))
	draw_menu(2, t(msg.video_camspeed))
	draw_menu(3, t(msg.video_digto))
	draw_menu(4, t(msg.video_full))

	draw_menu(5, t(msg.back), 10, 60)
	
	draw_item(0, menu_resolution, 200)
	draw_item(1, menu_proportion, 200)
	draw_bars(2, menu_cam_speed, 200)
	draw_bars(3, menu_font_speed, 200)
	draw_chck(4, menu_fullscreen, 200)
end
#endregion

#region INTERFACE MENU GRAPHIC
else if game.app.state == fsm_game.menuGraphic begin

	var _color = lite()? c_red: c_white

	var menu_reflex = game.app.render.mode_reflex
	var menu_outline = game.app.render.mode_outline
	var menu_hd_font = game.app.render.mode_font_hd
	var menu_hd_light = game.app.render.mode_light_hd

	draw_menu(0, t(msg.video_fnthd))
	draw_menu(1, t(msg.video_lighthd))
	draw_menu(2, t(msg.video_outline))
	draw_menu(3, t(msg.video_reflex))
	
	draw_menu(4, t(msg.back), 10, 60)
	
	draw_chck(0, menu_hd_font, 200, 30, _color)
	draw_chck(1, menu_hd_light, 200, 30, _color)
	draw_chck(2, menu_outline, 200, 30, _color)
	draw_chck(3, menu_reflex, 200, 30, _color)
end
#endregion

#region INTERFACE MENU AUDIO
else if game.app.state == fsm_game.menuAudio begin
	draw_menu(0, t(msg.menu_audio_geral))
	draw_menu(1, t(msg.menu_audio_music))
	draw_menu(2, t(msg.menu_audio_sfx))
	draw_menu(3, t(msg.back), 10, 60)
	
	
	draw_bars(0, game.app.audio.volume, 200)
	draw_bars(1, game.app.audio.mixer[0], 200)
	draw_bars(2, game.app.audio.mixer[1], 200)
end
#endregion

#region INTERFACE MENU TUTORIAL
else if game.app.state == fsm_game.menuTutorial begin	

	draw_set_text_config( fnt_game0, make_color_rgb(62, 70, 80), 1.0, fa_middle, fa_top)
	
	/// instances positions
	var _text = t(msg.tutorial_about)
	var _middle = display_get_gui_width()/2
	var _xx = display_get_gui_width()/3
	var _yy = display_get_gui_height()/3
	var _bottom = string_height_ext(_text, 32, _xx * 2)
	
	/// box text
	draw_rectangle(
		_middle - _xx - padding,
		_yy/2 - padding, 
		_middle + _xx + padding, 
		_yy/2 + _bottom + padding, 
		false
	)
	
	/// draw text description
	draw_set_alpha(0.8)
	draw_set_color(c_white)
	draw_text_ext(_middle, _yy/2, _text, 32, _xx * 2)
	
	/// draw text title
	draw_set_text_config(lite()? fnt_game0: fnt_title, c_white, 1.0, fa_center, fa_top)
	draw_text_hd(_middle, padding, t(msg.tutorial_title), 1.0)
	
	
	/// boxtutorial
	draw_tutorial(make_color_rgb(129,183,117), t(msg.tutorial_run),  0)
	draw_tutorial(make_color_rgb(91,106,120), t(msg.tutorial_move), 1)
	draw_tutorial([make_color_rgb(119,130,188), make_color_rgb(222,185,50)], t(msg.tutorial_switch), 2)
	draw_tutorial(make_color_rgb(189,91,76), t(msg.tutorial_interact), 3)

	/// keyboard/gamepad
	draw_sprite_align(spr_tuto_keyboard, 0, _xx, _yy, fa_left, fa_bottom, make_color_rgb(91,106,120), 1.0, 3)
	draw_sprite_align(spr_tuto_keyboard, 1, _xx, _yy, fa_left, fa_bottom, make_color_rgb(119,130,188), 1.0, 3)
	draw_sprite_align(spr_tuto_keyboard, 2, _xx, _yy, fa_left, fa_bottom, make_color_rgb(222,185,50), 1.0, 3)
	draw_sprite_align(spr_tuto_keyboard, 3, _xx, _yy, fa_left, fa_bottom, make_color_rgb(129,183,117), 1.0, 3)
	draw_sprite_align(spr_tuto_keyboard, 4, _xx, _yy, fa_left, fa_bottom, make_color_rgb(189,91,76), 1.0, 3)
	draw_sprite_align(spr_tuto_gamepad, 00, _xx, _yy, fa_right, fa_bottom, c_white, 1.0, 1.2)
		
	
	draw_menu(0, t(msg.back), 0, 150)
end
#endregion

#region INTERFACE VIDEOGAME MENU [MAIN|SELECT]
else if game.app.state == fsm_game.videogameMain begin

	draw_set_text_config(lite()? fnt_game0: fnt_title, c_white, 1.0, fa_center, fa_top)
	
	var _title = t(msg.menu_videogame_name)
	var _xx =  display_get_gui_width()/8
	var _xx0 = gui_get_x_align(_xx * -2, fa_center)
	var _xx3 = gui_get_x_align(_xx * 2, fa_center)
	var _center = display_get_gui_width()/2
	var _middle = display_get_gui_height()/2
	var _yysubtitle = string_height(_title) + (padding * 2)
	var _score = 0
	
	/// get global score
	for (var i = 0; i < array_length_1d(game.app.videogames); i++) begin
		_score += variable_instance_get(game.app.videogames[i], "myscore")
	end
		
	/// title videogame
	draw_text_hd(_center, padding, _title, 1.0)
	draw_text_transformed(_center, _yysubtitle, "total score: " + score_get_string(_score), 0.28, 0.28, 0)
	
	/// Configurar Textos da Interface
	draw_set_text_config(fnt_game0, c_white, 1.0, fa_center, fa_top)
	
	/// Menu voltar
	draw_set_alpha(select == 0? 1: 0.64)
	mouse_select(_xx0, _middle -128, t(msg.back), 0)
	draw_text(_xx0, _middle - 128, t(msg.back))
	
	/// Menu Opções
	draw_set_alpha(select == 1? 1: 0.64)
	mouse_select(_center, _middle -128, t(msg.menu_videogame_option), 1)
	draw_text(_center, _middle - 128, t(msg.menu_videogame_option))
	
	/// Menu Reiniciar
	draw_set_alpha(select == 2? 1: 0.64)
	mouse_select(_xx3, _middle - 128, t(msg.menu_videogame_reset), 2)
	draw_text(_xx3, _middle - 128, t(msg.menu_videogame_reset))		
	
	/// jogo da esquerda (ASTEROIDS)
	draw_set_alpha(select == 3? 1: 0.64)
	draw_rectangle(
		_xx0 - 64,
		_middle -32,
		_xx0 + 64,
		_middle + 32,
		true	
	)
	draw_text(_xx0, _middle + 48, t(msg.menu_videogame_game1))
	
	/// jogo do meio (Space Invaders)
	draw_set_alpha(select == 4? 1: 0.64)
	draw_rectangle(
		_center - 64,
		_middle -32,
		_center + 64,
		_middle + 32,
		true	
	)
	draw_text(_center, _middle + 48, t(msg.menu_videogame_game2))
	
	/// jogo da esquerda (Danki Towers)
	draw_set_alpha(select == 5? 1: 0.64)
	draw_rectangle(
		_xx3 - 64,
		_middle -32,
		_xx3 + 64,
		_middle + 32,
		true	
	)
	draw_text(_xx3, _middle + 48, t(msg.menu_videogame_game3))
	
end
#endregion

#region INTERFACE VIDEOGAME PLAY
else if game.app.state == fsm_game.videogamePlay begin

	draw_set_text_config(lite()? fnt_game0: fnt_title, c_white, 1.0, fa_center, fa_top)
	
	var _title = t(msg.menu_videogame_name)
	var _center = display_get_gui_width()/2
	var _yysubtitle = string_height(_title) + (padding * 2)
	var _score =  "score: " + score_get_string(variable_instance_get(game.app.videogames[game.app.select], "myscore"))
	
	/// title videogame
	draw_text_hd(_center, padding, _title, 1.0)
	draw_text_transformed(_center, _yysubtitle, _score, 0.28, 0.28, 0)
end
#endregion

#region GAMEOVER 
else if game.app.state == fsm_game.over begin
	var xx = display_get_gui_width()/2
	var yy = display_get_gui_height()/2
	
	draw_set_text_config(fnt_game1, c_red, 1.0, fa_center, fa_top)	
	draw_text_transformed(xx, -64, t(msg.gameover_title), 8, 8, 0)		
	
	draw_set_color(c_white)
	draw_text_ext_transformed(xx, 192, t(msg.gameover_text), 32, xx - 16, 2, 2, 0)
	draw_input(game.app.nickname, max_nickname)
	
	draw_gui(0, 0, fa_center, fa_bottom,  "SCORE: " + score_get_string(),fnt_game0, c_white, 4)
end
#endregion

#region CREDITS
else if game.app.state == fsm_game.credits begin
	var xx = display_get_gui_width()/2
	
	step += game.app.input.key_menu_enter? 4: 1
	
	draw_set_font(fnt_game0)
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)

	/// Reiniciar jogo
	if step > credits_scene.final then
		with game.app event_user(ev_mygame_restart)

	/// Em memoria de:
	else if step > credits_scene.memorial  begin
		var yy = display_get_gui_height() - self.step + credits_scene.memorial
		draw_text_ext_transformed_color(xx, yy, t(msg.memorial), 32, display_get_gui_width() - 16, 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	end
	
	/// Agredicimentos
	else begin
		var yy = display_get_gui_height() - self.step
		draw_text_ext_transformed_color(xx, yy, t(msg.credits), 32, display_get_gui_width() - 16, 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	end
	
end
#endregion

#region WAIT FOCUS
else if game.app.state == fsm_game.waitFocus begin
	draw_background(c_black, 1.0)
	draw_sprite(spr_jolt, 0, display_get_gui_width()/2, display_get_gui_height()/2)
	draw_gui(0, display_get_gui_height()/4, fa_center, fa_bottom, "mouse click to focus game", fnt_game1, c_white, current_second%2)
end
#endregion