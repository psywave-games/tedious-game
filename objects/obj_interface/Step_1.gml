
if not keyboard_check(vk_anykey) and not mouse_check_button(mb_any) then
	exit

var _in = game.app.input.key_menu_in

#region SELECT LANG
if game.app.state == fsm_game.lang and abs(_in) begin
	lang_set(self.select? msg.en: msg.pt)
	state_reset(game.app, fsm_game.warn)
end
#endregion

#region WARNING SKIP
else if game.app.state == fsm_game.warn and game.app.input.key_menu_in then
	state_reset( game.app, fsm_game.intro)

#endregion

#region OPEN MENU
else if game.app.input.key_menu_open begin 
	state_set (game.app, fsm_game.menuMain)
	game.app.interface.select = 0
end 
#endregion

#region BACK MENU
else if game.app.input.key_menu_esc begin 
	game.app.interface.select = 0
	state_back(game.app)
end
#endregion

#region NAVIAGATE MENU
else if abs (game.app.input.key_menu_go) begin
	switch game.app.state begin
	
		case fsm_game.lang:
			self.select = clamp( self.select + game.app.input.key_menu_go, 0, 1)
			break
	
		case fsm_game.menuMain:
			self.select = clamp( self.select + game.app.input.key_menu_go, 0, 3)
			break
			
		case fsm_game.menuOptions:
			self.select = clamp( self.select + game.app.input.key_menu_go, 0, 3)
			break
			
		case fsm_game.menuGraphic:
			self.select = clamp( self.select + game.app.input.key_menu_go, 0, 7)
			break	
			
		case fsm_game.menuAudio:
			self.select = clamp( self.select + game.app.input.key_menu_go, 0, 3)
			break
	end
end
#endregion

#region SET MENU MAIN
else if abs (game.app.input.key_menu_in) and game.app.state == fsm_game.menuMain begin
	switch game.app.interface.select begin
		/// JOGAR AGORA
		case 0:
			/// Começar Novo jogo
			if not game.app.started begin
				with game.app start
			end
			/// retomar jogo
			else begin
				state_back( game.app )
			end
			break			
	
		/// Enter menu options
		case 1: 
			state_set( game.app, fsm_game.menuOptions)
			game.app.interface.select = 0
			break
			
		/// Abrir placar dos lideres
		case 2:
			url_open_ext("https://tediusgame.com/scoreboard", "_blank")
			break
				
		/// Sair do jogo		
		case 3:
			// fechar jogo em desktop
			if os_browser  == browser_not_a_browser then
				game_end()
				
			// fechar jogo no navegador
			else 
				url_open_ext("javascript:window.close()", "_self")
				
			break
	end 
end
#endregion

#region SET MENU OPTIONS
else if abs (game.app.input.key_menu_in) and game.app.state == fsm_game.menuOptions begin
	switch game.app.interface.select begin
		/// Alterar idioma do jogo
		case 0:
			lang_set(game.app.lang == msg.en? msg.pt: msg.en)
			break
			
		/// Enter menu graphic
		case 1: 
			state_set( game.app, fsm_game.menuGraphic)
			game.app.interface.select = 0
			break
			
		/// Enter menu graphic
		case 2: 
			state_set( game.app, fsm_game.menuAudio)
			game.app.interface.select = 0
			break
			
		/// Voltar para menu anterior
		case 3:
			state_back( game.app )
			self.select = 0
			break
			
	end 
end
#endregion

#region SET MENU GRAPHIC
else if abs (game.app.input.key_menu_in) and game.app.state == fsm_game.menuGraphic begin
	switch game.app.interface.select begin
		/// alterar resolucao
		case 0:
			var last_resolution = array_length_1d(game.app.render.resolutions) - 1
			var resolution = game.app.render.mode_resolution + _in
			var mode = clamp(resolution, 0, last_resolution)
			resolution_set (mode, game.app.render.mode_ratio)
			break
			
		/// alterar proporção (ratio)
		case 1:
			var last_ratio = array_length_1d(game.app.render.size_ratio) - 1
			var ratio = game.app.render.mode_ratio + _in
			var mode = clamp(ratio, 0, last_ratio)
			resolution_set (game.app.render.mode_resolution, mode)
			break
			
		/// alternar fontes em HD
		case 2:
			gpu_set_texfilter(false)
			game.app.render.font_hd ^= true
			break
			
		/// alternar Luzes em HD
		case 3:
			game.app.render.light_hd ^= true
			break
		
			
		/// Font Speed
		case 4:
			var font_speed = game.app.render.font_speed + _in
			game.app.render.font_speed = clamp(font_speed, 1, 10)
			break
		
		/// Font Speed
		case 5:
			var font_speed = game.app.render.camera_speed + _in
			game.app.render.camera_speed = clamp(font_speed, 1, 10)
			break
		
			
		/// alternal tela cheia
		case 6:
			var fullscreen = not window_get_fullscreen()
			window_set_fullscreen(fullscreen)
			break
			
		/// voltar para o menu
		case 7:
			state_back( game.app )
			self.select = 0
			break
		
	end
end
#endregion

#region SET MENU AUDIO
else if abs (game.app.input.key_menu_in) and game.app.state == fsm_game.menuAudio begin
	switch game.app.interface.select begin
		/// Master volume do jogo
		case 0:
			var volume = game.app.audio.volume + _in
			game.app.audio.volume = clamp(volume, 0, 10)
			audio_master_gain( volume * 0.1 )
			break
			
		/// Musica volume do jogo
		case 1:
			var volume = game.app.audio.mixer[0] + _in
			game.app.audio.mixer[0] = clamp(volume, 0, 10)
			break
			
		/// Efeitos volume do jogo
		case 2:
			var volume = game.app.audio.mixer[1] + _in
			game.app.audio.mixer[1] = clamp(volume, 0, 10)
			break
			
		/// voltar para o menu
		case 3:
			state_back( game.app )
	end
end
#endregion

