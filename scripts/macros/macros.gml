/// GML MAIS AMIGAVEL
#macro	game				global			/// @example game.app.players

#macro	ev_init				0
#macro	ev_interact_down	1	//Iniciar Interação
#macro	ev_interact_up		2	//Desfazer Interação
#macro	ev_interact_switch	3	//Alterar Interação
#macro	ev_interact_message	4	//Menssagem Interação
#macro	ev_interact_broken	5
#macro	ev_lite_step		6
#macro	ev_game_start		15

enum word {
	slop = -1,
	limit_left = 10,
	limit_right = 502
}


enum system {
	windows_phone,
	windows,
	android,
	macosx,
	unix,
	ios
}

/// FINITE STATE MACHINE PLAYER MODE
enum fsm_player{
	none,									/// Quando não ativado
	died,									/// Jogador está morto
	jump,									/// Jogador está pulando
	idle,									/// Jogador está parado
	walk									/// Jogador está andando
}



/// FINITE STATE MACHINE GAME MODE
enum fsm_game {
	lang,									/// STATE: Selecione Idioma
	warn,									/// STATE: Aviso
	intro,									/// STATE: Intro do jogo
	menuMain,								/// STATE: Menu Principal/Pause
	menuOptions,							/// STATE: Menu de Opçoões
	menuGraphic,							/// STATE: Menu de graficos
	menuAudio,								/// STATE: Menu de Audio
	menuPallete,							/// STATE: Não utilizado
	cutscene,								/// STATE: Cenas de Jogo 
	play									/// STATE: Gameplay
}


enum fsm_mob {
	none,									/// STATE: sem interações
	idle,									/// STATE: desativado
	running,								/// STATE: interagindo
	broken									/// STATE: quebrado
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
	warn_title,
	warn_text,
	esrb,
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
	interact_suicide_power,
	video_camspeed,
	menu_audio_geral,
	menu_audio_music,
	menu_audio_sfx,
	interact_music_sandstorm,
	interact_sleep_down,
	interact_open,
	interact_close,
	interact_videogame,
	interact_music_despacitos,
	interact_sit_down,
	interact_sit_up,
	interact_shit_down,
	interact_shit_up,
	interact_urine_down,
	interact_urine_up,
	interact_clog_papper,
	interact_cooler_glasses,
	interact_music_turn_it,
	interact_drink_water,
	interact_furnace_gas,
	interact_furnace_fire,
	interact_furnace_off,
	interact_book,
	interact_book0,
	interact_book1,
	interact_book2,
	interact_book3,
	interact_book4,
	interact_book5,
	interact_book6,
	interact_book7,
	interact_book8,
	interact_book9,
	interact_book10,
	interact_book11,
	interact_book12,
	psy_chest,
	psy_drawer,
	interact_loot,
	interact_shower,
	primary_f,
	primary_m,
	secondary_f,
	secondary_m,
	interact_google,
	interact_furnace_hurt,
	interact_coffe_freezer_gap,
	interact_coffe_microwave_put,
	interact_coffe_microwave_gap,
	interact_coffe_freezer_put,
	interact_microwave_down,
	interact_music_2009,
	psy_door,
}

