/// @description Insert description here
// You can write your code in this editor

#region ANIMATION INTRO
if game.app.state == fsm_game.intro begin
	
	draw_gui(0, 0, fa_right, fa_middle, "5 Word", fnt_title, 5, 1, 0.4)
	draw_gui(0, 100, fa_center, fa_bottom, t(msg.press_start), fnt_game0, 15, alpha_start)
	
	if game.app.step % room_speed == false then 
		alpha_start ^= true
	
end
#endregion

#region INTERFACE MENU MAIN
else if game.app.state == fsm_game.menuMain begin
	
	draw_gui(0, 0, fa_center, fa_middle, t(msg.beta), fnt_game1, 5, 1, 0.4)
	draw_gui(0, 0, fa_right, fa_middle, "5 Word", fnt_title, 5, 1, 0.4)
	
	
	draw_menu(0, t(msg.menu_start))
	draw_menu(1, "Configurar")
	draw_menu(2, "Conquistas")
	draw_menu(3, "Sair", 10, 50)
end
#endregion

#region INTERFACE MENU OPTION
else if game.app.state == fsm_game.menuOptions begin
	

	draw_menu(0, t(msg.menu_lang))	
	draw_menu(1, t(msg.menu_video))
	draw_menu(2, t(msg.menu_audio))
	draw_menu(3, t(msg.back), 10, 60)
	
	draw_item(0, t(game.app.lang), 200)
end
#endregion

#region INTERFACE MENU GRAPHIC
else if game.app.state == fsm_game.menuGraphic begin
	//var menu_color_name = game.app.render.names[game.app.render.mode]
	var menu_resolution = string(display_get_gui_width()) + "x" + string(display_get_gui_height())
	//var menu_proportion = game.app.render.name_ratio[game.app.render.mode_ratio]
	var menu_fullscreen = window_get_fullscreen()
	//var menu_font_speed = game.app.render.font_speed
	
	
	draw_menu(0, t(msg.video_palete))
	draw_menu(1, t(msg.video_ratio))
	draw_menu(2, t(msg.video_size))
	draw_menu(3, t(msg.video_digto))
	draw_menu(4, t(msg.video_fnthd))
	draw_menu(5, t(msg.video_color))
	draw_menu(6, t(msg.video_full))
	draw_menu(7, t(msg.back), 10, 60)
	
	
	//draw_item(0, menu_color_name, 200)
	//draw_item(1, menu_proportion, 200)
	draw_item(2, menu_resolution, 200)
	//draw_bars(3, menu_font_speed, 200)
	//draw_chck(4, game.app.render.font_hd, 200)
	//draw_chck(5, game.app.render.colorize, 200)
	draw_chck(6, menu_fullscreen, 200)
end
#endregion

#region INTERFACE MENU AUDIO
else if game.app.state == fsm_game.menuAudio begin
	draw_menu(0, "Volume Geral:")
	draw_menu(1, "Volume Musica:")
	draw_menu(2, "Volume FX:")
	draw_menu(3, "Voltar", 10, 60)
	
	
	draw_bars(0, game.app.audio.volume, 200)
	draw_bars(1, game.app.audio.mixer[0], 200)
	draw_bars(2, game.app.audio.mixer[1], 200)
end
#endregion
