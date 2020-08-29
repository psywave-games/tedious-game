#region GAME LOGO
if game.app.state == fsm_game.menuMain
	or game.app.state == fsm_game.menuOptions
	or game.app.state == fsm_game.menuGraphic
	or game.app.state == fsm_game.menuWindow
	or game.app.state == fsm_game.menuAudio
	or game.app.state == fsm_game.intro
	begin 
	
	draw_gui(button_margin_horizontal, -100, fa_right, fa_middle, t(msg.game_name), lite()? fnt_game0: fnt_title, c_white, 1, lite()? font_size_title_lite: font_size_title)

end
#endregion
#region INTERFACE
switch game.app.state begin
	#region GAMEPLAY
	case fsm_game.play:
		var _date = text_time(false) + "\n" + text_date("-")
		var _font = game.app.fun.select == thematic.halflife? fnt_game1: fnt_game0
		var _color = game.app.fun.select == thematic.halflife? c_orange: c_white
		var _score_color = happy_sign < 0? c_red: _color
	
		/// FADOUT DYING
		if game.app.player.state = fsm_player.dying or game.app.player.state == fsm_player.died then
			draw_background(c_black, max(
				anim_fadeout(game.app.player.image_index, 0, 4),
				game.app.player.state == fsm_player.died
			)
		)
	
		if self.can_interact then 
			draw_gui(0, 0, fa_left, fa_top, self.message, _font, _color, 1.0, 1.4)
		draw_gui(0,0, fa_right, fa_bottom, text_build(), _font, _color, 1, 1)
		draw_gui(0,0, fa_left, fa_bottom, _date, _font, _color, 1, 1)
		draw_gui(0,0, fa_right, fa_top, text_score(), _font, _score_color, 1, 1.4)
		
		self.message = ""
		break
	#endregion
	#region LANGUAGE
	case fsm_game.lang:
		game.app.lang = msg.pt
		draw_menu(0, t(msg.pt), button_type_normal, 0, t(msg.menu_lang), button_color_text, fa_center, fa_middle)
		
		game.app.lang = msg.en
		draw_menu(1, t(msg.en), button_type_normal, 0, t(msg.menu_lang), button_color_text, fa_center, fa_middle)
		break
	#endregion
	#region WARNING
	case fsm_game.warn:
		var xx = display_get_gui_width()/2
		var yy = display_get_gui_height()/2
	
		draw_set_font(fnt_game1)
		draw_background(c_black, 1.0)
	
		/// PROSEGUIR
		if self.step > room_speed * 12 then
			state_reset(game.app, fsm_game.intro)
		
		/// AVISO
		else if self.step > room_speed * 4 begin
			draw_set_halign(fa_center)
			draw_set_valign(fa_top)
		
			draw_text_transformed_color(xx, -64, t(msg.warn_title), 8, 8, 0, c_red, c_red, c_red, c_red, 1)		
			draw_text_ext_transformed_color(xx, 160, t(msg.warn_text), 32, xx - 32, 2, 2, 0, c_white, c_white, c_white, c_white, 1)
			draw_background(c_black, anim_fade(self.step, room_speed * 4, room_speed * 12, room_speed/3))
		end
	
		/// FAXETARIA
		else begin		
			draw_sprite_ext(spr_esrb, 0, xx, yy, 1.2, 1.2, 0, c_white, 1)
			draw_set_halign(fa_left)
			draw_set_valign(fa_middle)
			draw_set_font(fnt_game1)
			draw_text_ext_transformed_color(xx - (xx/8), yy -40, t(msg.esrb), 16, yy, 2.4, 2.4, 0, c_black, c_black, c_black, c_black, 1)
			draw_background(c_black, anim_fade(self.step, 0, room_speed * 4, room_speed/3))
		end
		break
	#endregion
	#region INTRO
	case fsm_game.intro:
		draw_gui(0, 100, fa_center, fa_bottom, t(msg.press_start), fnt_game0, c_white, current_second%2)
		break
	#endregion
	#region MENU MAIN
	case fsm_game.menuMain:
		draw_menu(0, t(msg.menu_start))
		draw_menu(1, t(msg.menu_tutorial))
		draw_menu(2, t(msg.menu_config))
		draw_menu(3, t(msg.menu_exit), 10, 50)
		break
	#endregion
	#region MENU OPTION
	case fsm_game.menuOptions:
		draw_menu(0, t(game.app.lang), button_type_options, options(game.app.lang, msg.pt, msg.en), t(msg.menu_lang))
		draw_menu(1, t(msg.menu_gamepad), button_type_check, game.app.input.mode_button)
		draw_menu(2, t(msg.menu_window))
		draw_menu(3, t(msg.menu_video))
		draw_menu(4, t(msg.menu_audio))
		draw_menu(5, t(msg.back), 10, 60)
		break
	#endregion
	#region MENU WINDOW
	case fsm_game.menuWindow:
		var menu_resolution = game.app.render.resolution
		var menu_proportion = game.app.render.name_ratio[game.app.render.mode_ratio]
		var menu_fullscreen = fullscreen_get()
		var menu_cam_mode = t(msg.menu_video_cameramode0 + game.app.render.mode_camera)

		draw_menu(0, menu_resolution, button_type_options, options(game.app.render.mode_resolution, 0, last_resolution), t(msg.video_size))
		draw_menu(1, menu_proportion, button_type_options, options(game.app.render.mode_ratio, 0, last_ratio), t(msg.video_ratio))
		draw_menu(2, menu_cam_mode, button_type_options, options(game.app.render.mode_camera, 0, 5), t(msg.menu_video_cameramode))
		draw_menu(3, t(msg.video_digto))
		draw_menu(4, t(msg.video_full), button_type_check, menu_fullscreen)
		draw_menu(5, t(msg.back), 10, 60)
		break 
	#endregion
	#region MENU GRAPHYIC
	case fsm_game.menuGraphic:
		draw_menu(0, t(msg.video_fnthd), button_type_check, game.app.render.mode_shadow_hd)
		draw_menu(1, t(msg.video_lighthd), button_type_check, game.app.render.mode_light_hd)
		draw_menu(2, t(msg.video_outline), button_type_check, game.app.render.mode_outline)
		draw_menu(3, t(msg.video_reflex), button_type_check, game.app.render.mode_reflex)
		draw_menu(4, t(msg.back), 10, 60)
		break
	#endregion 
	#region MENU AUDIO
	case fsm_game.menuAudio:
		draw_menu(0, volume_get(volume_master), button_type_bars, options(volume_get(volume_master), 0, 10), t(msg.menu_audio_geral))
		draw_menu(1, volume_get(volume_music), button_type_bars, options(volume_get(volume_music), 0, 10), t(msg.menu_audio_music))
		draw_menu(2, volume_get(volume_fx), button_type_bars, options(volume_get(volume_fx), 0, 10), t(msg.menu_audio_sfx),)
		draw_menu(3, t(msg.menu_audio_mute), button_type_check, game.app.audio.mute)
		draw_menu(4, t(msg.back), 10, 60)
		break
	#endregion
	#region MENU TUTORIAL
	case fsm_game.menuTutorial:
		draw_set_text_config(fnt_game0, make_color_rgb(62, 70, 80), 1.0, fa_middle, fa_top)
		
		/// instances positions
		var _text = t(msg.tutorial_about)
		var _center = display_get_gui_width()/2
		var _middle = display_get_gui_height()/2
		var _xx = display_get_gui_width()/3
		var _yy = display_get_gui_height()/3
		var _ratio = ratio_get()
		var _resolution = game.app.render.size_resolution[game.app.render.mode_resolution]
		var _mobile = game.app.render.mode_ratio == 0
		var _mini = _resolution <= 640 or (_ratio == 1.0 and _resolution < 900)
		var _size = _mobile? 1.4: clamp(_resolution/1280, 0.6924, 8)
		var _sizet = max(_resolution/900, 1)
		var _bottom = string_height_ext(_text, 32, (_xx*2/_sizet))
		var _vak = _mini? fa_center: fa_left
		var _vag = _mini? fa_center: fa_right
		var _vhkg = fa_top
		var _xxkg = _mini? 0: _xx
		var _yyk = _mini? gui_get_y_align(128 * _size, fa_middle):  _yy + (_bottom * _sizet) + 16
		var _yyg = _mini? gui_get_y_align(-128 * _size, fa_middle): _yy + (_bottom * _sizet) + 16
		show_debug_message(_ratio)
	
		if not _mini or (_mobile and _resolution > 640) begin
			/// box text
			draw_rectangle(
				_center - _xx - padding,
				_yy/2 - padding, 
				_center + padding + _xx , 
				_yy/2 + padding + (_bottom * _sizet), 
				false
			)
	
			/// draw text description
			draw_set_alpha(0.8)
			draw_set_color(c_white)
			draw_text_ext_transformed(_center, _yy/2, _text, 32, (_xx*2)/_sizet, _sizet, _sizet, 0)
		end
	
		/// draw text title
		draw_set_text_config(lite()? fnt_game0: fnt_title, c_white, 1.0, fa_center, fa_top)
		draw_text_hd(_center, padding, t(msg.tutorial_title), 1.0)
	
	
		/// boxtutorial
		draw_tutorial(make_color_rgb(129,183,117), t(msg.tutorial_run),  0, _size)
		draw_tutorial(make_color_rgb(91,106,120), t(msg.tutorial_move), 1, _size)
		draw_tutorial([make_color_rgb(119,130,188), make_color_rgb(222,185,50)], t(msg.tutorial_switch), 2, _size)
		draw_tutorial(make_color_rgb(189,91,76), t(msg.tutorial_interact), 3, _size)
		

		/// keyboard/gamepad
		if not _mobile begin
			draw_sprite_align(spr_tuto_keyboard, 0, _xxkg, _yyk, _vak, _vhkg, make_color_rgb(91,106,120), 1.0, _size * 3.0)
			draw_sprite_align(spr_tuto_keyboard, 1, _xxkg, _yyk, _vak, _vhkg, make_color_rgb(119,130,188), 1.0, _size * 3.0)
			draw_sprite_align(spr_tuto_keyboard, 2, _xxkg, _yyk, _vak, _vhkg, make_color_rgb(222,185,50), 1.0, _size * 3.0)
			draw_sprite_align(spr_tuto_keyboard, 3, _xxkg, _yyk, _vak, _vhkg, make_color_rgb(129,183,117), 1.0, _size * 3.0)
			draw_sprite_align(spr_tuto_keyboard, 4, _xxkg, _yyk, _vak, _vhkg, make_color_rgb(189,91,76), 1.0, _size * 3.0)
			draw_sprite_align(spr_tuto_gamepad, 00, _xxkg, _yyg, _vag, _vhkg, c_white, 1.0, _size * 1.2)
		end
	break
	#endregion
	#region VGN PLAY
	case fsm_game.videogamePlay:
		draw_set_text_config(lite()? fnt_game0: fnt_title, c_white, 1.0, fa_center, fa_top)
	
		var _title = t(msg.menu_videogame_name)
		var _center = display_get_gui_width()/2
		var _yysubtitle = string_height(_title) + (padding * 2)
		var _score =  "score: " + score_get_string(variable_instance_get(game.app.videogames[game.app.select], "myscore"))
	
		if variable_instance_exists(game.app.videogames[game.app.select], "life") then
			_score +=  "\nlifes: " + string(variable_instance_get(game.app.videogames[game.app.select], "life"))
	
		/// title videogame
		draw_text_hd(_center, padding, _title, 1.0)
		draw_text_transformed(_center, _yysubtitle, _score, 0.28, 0.28, 0)
		break
	#endregion
	#region VGN MENU MAIN
	case fsm_game.videogameMain:
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
	break
	#endregion
	#region GAME OVER
	case fsm_game.over:
		var xx = display_get_gui_width()/2
		var yy = display_get_gui_height()/2
	
		draw_background(c_black, 1.0)
		draw_set_text_config(fnt_game1, c_red, 1.0, fa_center, fa_top)	
		draw_text_transformed(xx, -64, t(msg.gameover_title), 8, 8, 0)		
	
		draw_set_color(c_white)
		draw_text_ext_transformed(xx, 192, t(msg.gameover_text), 32, xx - 16, 2, 2, 0)
		draw_input(game.app.nickname, max_nickname)
	
		draw_gui(0, 0, fa_center, fa_bottom,  "SCORE: " + score_get_string(),fnt_game0, c_white, 4)
		break
	#endregion
	#region CREDITS
		var xx = display_get_gui_width()/2

		step += game.app.input.key_menu_enter? 4: 0
	
		draw_set_font(fnt_game0)
		draw_set_halign(fa_center)
		draw_set_valign(fa_top)

		/// Reiniciar jogo
		if step > room_speed * 100 then
			with game.app event_user(ev_mygame_restart)

		/// Em memoria de:
		else if step > room_speed * 81 begin
			var yy = display_get_gui_height() - self.step + (room_speed * 81)
			draw_text_ext_transformed_color(xx, yy, t(msg.memorial), 32, display_get_gui_width()/3, 2, 2, 0, c_white, c_white, c_white, c_white, 1)
		end
	
		/// Agredicimentos
		else begin
			var yy = display_get_gui_height() - self.step
			draw_text_ext_transformed_color(xx, yy, t(msg.credits), 32, display_get_gui_width()/3, 2, 2, 0, c_white, c_white, c_white, c_white, 1)
		end
	
		draw_background( c_black, anim_fade(self.step, 0, room_speed * 100, room_speed * 3))
		break
	#endregion
	#region WAIT FOCUS
	case fsm_game.waitFocus:
		draw_background(c_black, 1.0)
		draw_sprite(spr_jolt, 0, display_get_gui_width()/2, display_get_gui_height()/2)
		draw_gui(0, display_get_gui_height()/4, fa_center, fa_bottom, "mouse click to focus game", fnt_game1, c_white, current_second%2)
		break
	#endregion
	#region LOAD
	case fsm_game.loading:
		draw_background(c_black, 1.0)
		draw_set_color(c_white)
		draw_text(0, 0, "Loading...")
		break
	case fsm_game.loaded:
		draw_background(c_black, 1.0)
		break
	#endregion
end
#endregion