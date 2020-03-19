/// @description Insert description here
// You can write your code in this editor

/// alias shor
var _in = game.app.input.key_menu_in

#region OPEN MENU
if game.app.input.key_menu_open begin 
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
				
		/// Sair do jogo		
		case 3:
			game_end()
			break
			
	end 
end
#endregion

#region SET MENU OPTIONS
else if abs (game.app.input.key_menu_in) and game.app.state == fsm_game.menuOptions begin
	switch game.app.interface.select begin
		/// Alterar idioma do jogo
		case 0:
			game.app.lang = game.app.lang == msg.en? msg.pt: msg.en
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
		/// alterar paleta de cores
		case 0:
			var color = game.app.render.mode + _in 
			game.app.render.mode = clamp(color, 0, 9)
			with game.app.render init 
			break
			
		/// alterar proporção (ratio)
		case 1:
			var ratio = game.app.render.mode_ratio + _in
			var mode = clamp(ratio, 0, 3)
			resolution_set (game.app.render.mode_resolution, mode)
			break
			
		/// alterar resolucao
		case 2:
			var last_resolution = array_length_1d(game.app.render.resolutions) - 1
			var resolution = game.app.render.mode_resolution + _in
			var mode = clamp(resolution, 0, last_resolution)
			resolution_set (mode, game.app.render.mode_ratio)
			break
			
		/// Font Speed
		case 3:
			var font_speed = game.app.render.font_speed + _in
			game.app.render.font_speed = clamp(font_speed, 1, 10)
			break
		
		/// alternar fontes em HD
		case 4:
			gpu_set_texfilter(false)
			game.app.render.font_hd ^= true
			break
			
		/// alternar colorização
		case 5:
			game.app.render.colorize ^= true
			with game.app.render init
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

