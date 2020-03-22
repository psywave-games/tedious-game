/// GML MAIS AMIGAVEL
#macro	game				global			/// @example game.app.players

/// USER EVENTS MAIS AMIGAVEIS
#macro	init				event_user(0)	/// @example with game.app.interface init
#macro	start				event_user(15)	/// @example with game.app start


enum word {
	slop = -1,
	limit_left = 10,
	limit_right = 502
}


/// FINITE STATE MACHINE PLAYER MODE
enum fsm_player{
	none,									/// Quando não ativado
	died,									/// Jogador está morto
	jump,									/// Jogador está pulando
	fall,									/// Jogador está caido
	idle,									/// Jogador está parado
	walk									/// Jogador está andando
}



/// FINITE STATE MACHINE GAME MODE
enum fsm_game {
	intro,									/// STATE: Intro do jogo
	menuMain,								/// STATE: Menu Principal/Pause
	menuOptions,							/// STATE: Menu de Opçoões
	menuGraphic,							/// STATE: Menu de graficos
	menuAudio,								/// STATE: Menu de Audio
	menuPallete,							/// STATE: Não utilizado
	cutscene,								/// STATE: Cenas de Jogo 
	play									/// STATE: Gameplay
}


enum msg {
	pt,	
	en,
	press_start,
	menu_start,
	menu_lang,
	menu_video,
	menu_audio,
	back,
	video_palete,
	video_ratio,
	video_size,
	video_digto,
	video_fnthd,
	video_color,
	video_full,
	beta,
	menu_exit,
	scorebord,
	interact_on,
	interact_off,
	interact_gap,
	menu_config,
	game_name,
	video_lighthd,
	psy_light,
	psy_bed,
	psy_tv,
	psy_freezer,
	psy_sofa,
	psy_radio,
	psy_furnace,
	psy_microwave,
	psy_chair,
	psy_laterna,
	psy_ruindows,
	psy_instagram,
	psy_power,
	psy_switch,
	suicide_power,
	video_camspeed
}

#macro	install_speak					self.speak_finish=0;self.speak_init=0;self.speak_mode=0;self.speak_text="";self.speak_step=0
