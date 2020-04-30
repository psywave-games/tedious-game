/// GML MAIS AMIGAVEL
#macro	game				global			/// @example game.app.players
#macro	max_nickname		16

#macro	channels_for_music	0,1,2
#macro	channels_for_sfx	3,4,5,6,7,8,9,10,11,12,13,14,15
#macro	volume_master		2
#macro	volume_music		0
#macro	volume_fx			1

#macro	ev_init				0
#macro	ev_interact_down	1	//Iniciar Interação
#macro	ev_interact_up		2	//Desfazer Interação
#macro	ev_interact_switch	3	//Alterar Interação
#macro	ev_interact_message	4	//Menssagem Interação
#macro	ev_interact_broken	5
#macro	ev_interact_using	7
#macro	ev_lite_step		6
#macro	ev_mygame_restart	14
#macro	ev_mygame_start		15

#macro  color_verde_a		(0xC4E43A)
#macro  color_verde_b		(0xC4FD39)
#macro  color_amarelo_a		(0xC5E7E8)
#macro  color_marrom_a		(0xA0B3F3)
#macro  color_marrom_b		(0x6569AD)
#macro  color_amarelo_b		(0x7CEBFF)
#macro  color_azul_a		(0xFF9500)
#macro  color_azul_b		(0xF1FF01)
#macro  color_vermelho		(0x4358FF)
#macro  color_verde_c		(0x84FF78)
#macro  color_cinza_a		(0x9BA25B)
#macro  color_cinza_b		(0xB6BC89)
#macro  color_cinza_c		(0xD4D7B9)
#macro  color_branco		(0xF2F2F2)
#macro  color_cinza_d		(0xA7A7A7)
#macro	color_verde_d		(0x4f4f2f)

#macro	padding				10

enum word {
	limit = 10,
	height = 72,
	depth_player = 200,
	depth_stair = 350
}


enum need {
	water,
	food
}

/// FINITE STATE MACHINE PLAYER MODE
enum fsm_player{
	none,									/// Quando não ativado
	died,									/// Jogador está morto
	idle,									/// Jogador está parado
	walk,									/// Jogador está andando
	dying,									/// Jogador está se matando	
	drink,									/// Jogador está bebendo
	sleep,									/// Jogador está dormindo
	sit										/// Jogador está sentado	
}



/// FINITE STATE MACHINE GAME MODE
enum fsm_game {
	lang,									/// STATE: Selecione Idioma
	warn,									/// STATE: Aviso
	intro,									/// STATE: Intro do jogo
	menuMain,								/// STATE: Menu Principal/Pause
	menuTutorial,							/// STATE: Menu tutorial
	menuOptions,							/// STATE: Menu de Opções
	menuGraphic,							/// STATE: Menu de graficos
	menuWindow,								/// STATE: Menu de Janela
	menuAudio,								/// STATE: Menu de Audio
	cutscene,								/// STATE: Cenas de Jogo 
	play,									/// STATE: Gameplay
	over,									/// STATE: Fim de jogo
	credits,								/// STATE: Creditos finais
	waitFocus								/// STATE: Wait Focus
}


enum fsm_mob {
	none,									/// STATE: sem interações
	idle,									/// STATE: desativado
	running,								/// STATE: interagindo
	broken									/// STATE: quebrado
}

enum credits_scene {
	memorial = 3888,
	final = 4777
}


enum msg {
	pt,	
	en,
	press_start,
	menu_start,
	menu_lang,
	menu_window,
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
	video_outline,
	video_reflex,
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
	psy_computer,
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
	interact_drink_energy,
	interact_furnace_gas,
	interact_furnace_fire,
	interact_furnace_off,
	interact_freezer_list,
	interact_freezer_emputy,
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
	interact_pan_furnace_put,
	interact_soap_freezer_gap,
	interact_soap_freezer_put,
	interact_soap_furnace_gap,
	interact_coffe_freezer_gap,
	interact_coffe_freezer_put,
	interact_coffe_furnace_gap,
	interact_coffe_furnace_put,
	interact_ramen_furnace_gap,
	interact_ramen_furnace_put,
	interact_microwave_down,
	interact_music_2009,
	psy_door,
	interact_bible,
	interact_bible0,
	interact_bible1,
	interact_bible2,
	interact_bible3,
	interact_bible4,
	interact_bible5,
	interact_bible6,
	interact_bible7,
	interact_bible8,
	interact_bible9,
	interact_bible10,
	interact_bible11,
	interact_bible12,
	gameover_title,
	gameover_text,
	credits,
	memorial,
	interact_switch,
	interact_picture_down,
	interact_picture_rate,
	interact_broken,
	interact_furnace_down,
	interact_furnace_rate,
	interact_water_full,
	interact_food_full,
	interact_soon_down,
	interact_soon_rate,
	interact_stair_down,
	interact_stair_up,
	menu_tutorial,
	menu_gamepad,
	psy_energy,
	psy_joystick,
	psy_coffe,
	psy_soap,
	psy_ramen,
}

