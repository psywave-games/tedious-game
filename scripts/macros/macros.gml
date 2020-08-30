/// GML MAIS AMIGAVEL
#macro	game						global			/// @example game.app.players
#macro	max_nickname				16				/// max characteres for string name
#macro	database_file				"data.ini"		/// Database name
#macro	database_global				"global game"	/// [section INI name]
#macro	light_alpha					0.1
#macro	is_mobile					(game.app.render.mode_ratio == 0)
#macro	is_browser					(os_browser != browser_not_a_browser)
#macro	null_surface				((os_browser != browser_not_a_browser)? 0: noone)

#macro	volume_master				2				/// channel master
#macro	volume_music				0				/// channel mixer 0
#macro	volume_fx					1				/// channel mixer 1
#macro	volume_voice				3				/// channel mixer 3

/// window sizes
#macro	padding						10
#macro	font_size_title_lite		2.60
#macro	font_size_title				0.80
#macro	font_size_menu				0.32
#macro	font_size_description		0.80
#macro	last_resolution				array_length_1d(game.app.render.name_resolution) - 1
#macro	last_ratio					array_length_1d(game.app.render.name_ratio) - 1


/// buttom config
#macro	button_menu_width			(game.app.render.mode_ratio? 300: 400)
#macro	button_menu_height			(game.app.render.mode_ratio? 56: 64)
#macro	button_menu_padding			(game.app.render.mode_ratio? 20: 32)
#macro	button_menu_round			_height/6
#macro	button_type_normal			0
#macro	button_type_check			1
#macro	button_type_options			2
#macro	button_type_bars			3
#macro	button_alpha_normal			0.75
#macro	button_alpha_hover			1.00
#macro	button_color_text			0xb9b5b0
#macro	button_color_background		0x50463e
#macro	button_font_description		fnt_game0
#macro	button_font_value			fnt_menu
#macro	button_default_ah			(game.app.render.mode_ratio? fa_left: fa_center)
#macro	button_default_vh			(game.app.render.mode_ratio? fa_middle: fa_top)
#macro	button_default_xx			0
#macro	button_default_yy			(game.app.render.mode_ratio? 0: 150)
#macro	button_margin_vertical		10
#macro	button_margin_horizontal	64

/// Console config
#macro	console_font_value			fnt_game0


#macro	ev_init						0		/// Alteração de estado de jogo
#macro	ev_interact_down			1		/// Iniciar Interação
#macro	ev_interact_up				2		/// Desfazer Interação
#macro	ev_interact_switch			3		/// Alterar Interação
#macro	ev_interact_message			4		/// Menssagem Interação
#macro	ev_interact_broken			5		/// Quebrado Interação
#macro	ev_interact_using			7		/// Utilizando Interação
#macro	ev_lite_step				6		/// Ticket leve (apenas visivel, 3x por segundo)
#macro	ev_mygame_restart_end		10		/// Após Preparar jogo para reiniciar
#macro	ev_mygame_start_end			11		/// Após Iniciar Jogo
#macro	ev_mygame_end				13
#macro	ev_mygame_restart			14		/// Preparar jogo para reiniciar
#macro	ev_mygame_start				15		/// Iniciar Jogo


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


/// asteroids graphics
#macro	art_asteroid_large		[9,0, 9,5, 5,4, 0,10, 6,13, 3,16, 5,20, 10,22, 16,22, 19,19, 20,17, 22,14, 22,11, 18,4, 9,0]
#macro	art_asteroid_mid		[2,0, 0,7, 3,11, 3,16, 8,17, 12,15, 16,14, 12,4, 16,1, 6,0, 2,0]
#macro	art_asteroid_small		[1,0, 0,1, 1,3, 1,4, 0,6, 2,7, 4,7, 6,6, 7,5, 7,1, 4,1, 3,2, 1,0]
#macro	art_asteroid_mini		[2,0, 2,2, 0,2, 0,4, 1,6, 2,6, 2,5, 5,5, 6,3, 4,2, 4,0, 2,0]
#macro	art_veh_player			[0,0, 1,1, 1,7, 0,8, 8,4, 0,0]
#macro	art_veh_enemy			[10,5, 8,3, 7,3, 5,5, 3,5, 1,6, 0,6, 0,7, 2,8, 13,8, 15,7, 15,6, 1,6, 3,5, 12,5, 14,6]
#macro	art_invader0			[2,0, 2,14, 0,14, 0,15, 3,15, 3,11, 12,11, 12,15, 15,15, 15,14, 13,14, 13,0, 12,0, 12,4, 10,4, 9,2, 6,2, 5,4, 3,4, 3,0, 2,0]
#macro	art_invader1			[0,0, 0,5, 2,7, 2,15, 5,15, 5,14, 3,14, 3,11, 12,11, 12,14, 10,14, 10,15, 13,15, 13,7, 15,5, 15,0, 14,0, 14,5, 10,6, 9,2, 6,2, 5,6, 2,6, 1,5, 1,0, 0,0]

#macro	gamejolt_api_id			"478388"		
#macro	gamejolt_api_token		"810d041ed39a0594fb8131c748fe86a0"
#macro	gamejolt_score_survive	"485435"
#macro	gamejolt_score_speedrun	"507729"
#macro	gamejolt_score_points	"507767"
#macro	gamejolt_trophy_started "122109"


enum word {
	limit = 10,
	height = 72,
	depth_player = 200,
	depth_stair = 350
}


enum need {
	sleep,
	water,
	food
}

/// FINITE STATE MACHINE PLAYER MODE
enum fsm_player {
	none,									/// Quando não ativado
	died,									/// Jogador está morto
	idle,									/// Jogador está parado
	walk,									/// Jogador está andando
	dying,									/// Jogador está se matando	
	drink,									/// Jogador está bebendo
	sleep,									/// Jogador está dormindo
	piss,									/// Jogador está mijando
	sit,									/// Jogador está sentado
	guitar_idle,							/// Jogador está parado com o violão
	guitar_walk,							/// Jogador está andando o violão
	shower									/// Jogador está tomando banho										
}



/// FINITE STATE MACHINE GAME MODE
enum fsm_game {
	loading,								/// STATE: Carregando jogo
	loaded,									/// STATE: Carregado Jogo
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
	waitFocus,								/// STATE: Wait Focus
	videogameMain,							/// STATE: Menu Principal/Pause VIDEOGAME
	videogameMenu,							/// STATE: Menu de Opções VIDEOGAME
	videogamePlay							///	STATE: Gameplay VIDEOGAME
}


enum fsm_mob {
	none,									/// STATE: sem interações
	idle,									/// STATE: desativado
	running,								/// STATE: interagindo
	broken									/// STATE: quebrado
}


enum thematic {
	none,	
	halflife,
	credits,
	//chris,
	//gta,
	size
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
	interact_unmotivated,
	interact_light_rate,
	interact_light_rate2,
	interact_sleep_full,
	interact_toilet_down,
	interact_toilet_up,
	interact_energy_bordao,
	tutorial_run,
	tutorial_move,
	tutorial_switch,
	tutorial_interact,
	tutorial_about,
	tutorial_title,
	interact_rate_refreshed,
	interact_music_stop,
	menu_videogame_name,
	menu_videogame_reset,
	menu_videogame_game1,
	menu_videogame_game2,
	menu_videogame_game3,
	menu_videogame_game4,
	menu_videogame_game5,
	menu_videogame_game6,
	menu_videogame_game7,
	menu_videogame_game8,
	menu_videogame_game9,
	menu_videogame_option,
	menu_videogame_option_color,
	menu_videogame_option_outline,
	menu_videogame_option_volume,
	menu_video_cameramode,
	menu_video_cameramode0,
	menu_video_cameramode1,
	menu_video_cameramode2,
	menu_video_cameramode3,
	menu_video_cameramode4,
	menu_video_cameramode5,
	psy_shower,
	interact_shower_up,
	interact_shower_down,
	menu_audio_mute,
}

