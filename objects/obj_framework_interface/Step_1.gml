#region DETECT INPUTS
if not game.app.input.pressed_any then
	exit

var _in = game.app.input.key_menu_in
self.can_interact = false
#endregion
#region SELECT LANG
if game.app.state == fsm_game.lang and abs(_in) begin
	lang_set(self.select? msg.en: msg.pt)
end
#endregion
#region WARNING SKIP
else if game.app.state == fsm_game.warn and game.app.input.key_menu_in then
	state_reset( game.app, fsm_game.intro)

#endregion
#region OPEN MENU
else if game.app.input.key_menu_open begin 
	state_set (game.app, fsm_game.menuMain)
end 
#endregion
#region BACK MENU
else if game.app.input.key_menu_esc begin 
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
			self.select = clamp( self.select + game.app.input.key_menu_go, 0, 4)
			break
		
		case fsm_game.menuWindow:
			self.select = clamp( self.select + game.app.input.key_menu_go, 0, 4)
			break
		
		case fsm_game.menuGraphic:
			self.select = clamp( self.select + game.app.input.key_menu_go, 0, 3)
			break	
			
		case fsm_game.menuAudio:
			self.select = clamp( self.select + game.app.input.key_menu_go, 0, 4)
			break
			
		case fsm_game.videogameMain:
			self.select = clamp( self.select + game.app.input.key_menu_go, 0, 5)
			break
	end
end
#endregion
#region SET MENU MAIN
else if abs (game.app.input.key_menu_in) and game.app.state == fsm_game.menuMain begin
	switch self.select begin
		/// JOGAR AGORA
		case 0:
			/// Começar Novo jogo
			if not game.app.started begin
				with game.app event_user(ev_mygame_start)
			end
			/// retomar jogo
			else begin
				state_back( game.app )
			end
			break	
		
		/// How to play
		case 1:
			state_set( game.app, fsm_game.menuTutorial)
			break
	
		/// Enter menu options
		case 2: 
			state_set( game.app, fsm_game.menuOptions)
			break
				
		/// Sair do jogo		
		case 3:
			// fechar jogo em desktop
			if not is_browser then
				game_end()
				
			// fechar jogo no navegador
			else 
				web_game_end()
				
			break
	end 
end
#endregion
#region SET MENU OPTIONS
else if abs (game.app.input.key_menu_in) and game.app.state == fsm_game.menuOptions begin
	switch self.select begin
		/// Alterar idioma do jogo
		case 0:
			lang_set(game.app.lang == msg.en? msg.pt: msg.en)
			break
			
		/// Enter menu window
		case 1: 
			state_set( game.app, fsm_game.menuWindow)
			break
			
		/// Enter menu graphic
		case 2: 
			state_set( game.app, fsm_game.menuGraphic)
			break
			
		/// Enter menu graphic
		case 3: 
			state_set( game.app, fsm_game.menuAudio)
			break
			
		/// Voltar para menu anterior
		case 4:
			state_back( game.app )
			break
			
	end 
end
#endregion
#region SET MENU DISPLAY
else if abs (game.app.input.key_menu_in) and game.app.state == fsm_game.menuWindow begin
	switch self.select begin
		/// alterar resolucao
		case 0:
			var resolution = game.app.render.mode_resolution + _in
			var mode = clamp(resolution, 1, last_resolution)
			resolution_set (mode, game.app.render.mode_ratio)
			break
			
		/// alterar proporção (ratio)
		case 1:
			var ratio = game.app.render.mode_ratio + _in
			var mode = clamp(ratio, 0, last_ratio)
			resolution_set (game.app.render.mode_resolution, mode)
			break
	
		/// Cam Mode
		case 2:
			var cam_speed = game.app.render.mode_camera + _in
			game.app.render.mode_camera = clamp(cam_speed, 0, 5)
			break
			
		
		/// alternal tela cheia
		case 3:
			var fullscreen = not fullscreen_get()
			fullscreen_set(fullscreen)
			break
			
		/// voltar para o menu
		case 4:
			state_back( game.app )
			break	
	end
end
#endregion
#region SET MENU GRAPHIC
else if abs (game.app.input.key_menu_in) and game.app.state == fsm_game.menuGraphic begin
	switch self.select begin
		/// alternar Luzes em HD
		case 0:
			game.app.render.mode_light_hd ^= true
			break
			
		/// alternar Outiline
		case 1:
			game.app.render.mode_outline ^= true
			break
			
		/// alternar Reflexos
		case 2:
			game.app.render.mode_reflex ^= true
			break
			
		/// voltar para o menu
		case 3:
			state_back( game.app )
			break
		
	end
end
#endregion
#region SET MENU AUDIO
else if abs (game.app.input.key_menu_in) and game.app.state == fsm_game.menuAudio begin
	switch self.select begin
		/// Master volume do jogo
		case 0:
			volume_set(volume_master, clamp(volume_get(volume_master) + _in, 0, 10))
			break
			
		/// Musica volume do jogo
		case 1:
			volume_set(volume_music, clamp(volume_get(volume_music) + _in, 0, 10))
			break
			
		/// Efeitos volume do jogo
		case 2:
			volume_set(volume_fx, clamp(volume_get(volume_fx) + _in, 0, 10))
			break
			
		/// Mutar
		case 3:
			game.app.audio.mute ^= true
			volume_set(volume_master, volume_get(volume_master))
			break
			
		/// voltar para o menu
		case 4:
			state_back( game.app )
	end
end
#endregion
#region SET VIDEOGAME MENU MAIN
else if game.app.state == fsm_game.videogameMain and game.app.input.key_menu_enter begin
	switch self.select begin
		/// menu voltar
		case 0:
			state_back(game.app)
			break
			
		/// reset atual game
		case 2:
			with game.app.videogames[clamp(game.app.select, 0, array_length_1d(game.app.videogames) -1)] begin
				event_user(ev_mygame_restart)
			end
			state_set(game.app, fsm_game.videogamePlay)
			break
		
		/// play asteroids (game 0)
		case 3:
			game.app.select = 0
			state_set(game.app, fsm_game.videogamePlay)
			break
			
		/// play space invaders (game1)
		case 4:
			game.app.select = 1
			state_set(game.app, fsm_game.videogamePlay)
			break
	end
end
#endregion
#region GAMEOVER WRITE NICKNAME
else if game.app.state == fsm_game.over begin
	var _len = string_length(game.app.nickname)
	var _text = game.app.input.key_input_text

	/// deletar texto
	if game.app.input.key_menu_delete and _len > 0 then
		game.app.nickname = string_delete(game.app.nickname, _len, 1)

	/// escrever texto
	else if string_length(_text) <= 1 and _len < max_nickname then
		game.app.nickname = game.app.nickname + _text
		
	else if game.app.input.key_menu_enter begin
		state_reset(game.app, fsm_game.credits)
		self.step = 0
	end
end
#endregion
#region WAIT FOCUS
else if game.app.state == fsm_game.waitFocus and game.app.input.key_menu_in then
	lang_load()
	
#endregion