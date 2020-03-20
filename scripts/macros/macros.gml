///////
///
///	@function macros
///	@author RodrigoDornelles <rodrigo@dornelles.me>
///
///	@version	1.0		(09/12/2019) #7d9f25c chaves graphical improvements
///	@revison	1.1		(12/12/2019) #7b5387a started design pattern finite state machine
///
///////
///
/// @see				processado antes de transpilar
///	@description		constantes e macros do jogo
///
///////
///
///	@return void		
///
///////


/// GML MAIS AMIGAVEL
#macro	use					;				/// @example use variable_global()
#macro	void				;				/// @example return void
#macro	game				global			/// @example game.app.players

/// USER EVENTS MAIS AMIGAVEIS
#macro	init				event_user(0)	/// @example with game.app.interface init
#macro	finish				event_user(1)	/// @example with game.app.interface finish
#macro	start				event_user(15)	/// @example with game.app start



enum word {
	gravity	= 4,
	slop = -3
}


/// FINITE STATE MACHINE PLAYER MODE
enum fsm_player{
	none,									/// Quando não ativado
	died,									/// Jogador está morto
	fall,									/// Jogador está caido
	idle,									/// Jogador está parado
	walk,									/// Jogador está andando
	atck,									/// Jogador está atacando
}

/// FINITE STATE MACHINE BOSS IA MODE	
enum fsm_ia_boss {
	none,									/// NPC não ativado
	sleep,									/// NPC está parado
	attack0,								/// NPC está usando ataque primario
	attack1,								/// NPC está usando ataque secundario
	especial								/// NPC está usando ataque ultimate
}

/// FINITE STATE MACHINE NPC IA MODE	
enum fsm_ia_npc {
	none,									/// NPC não ativado
	sleep,									/// NPC está parado
	attack,									/// NPC está atacando
	hunter,									/// NPC está está caçando
	escape									/// NPC está fugindo
}

enum fsm_attack {
	none,									/// ATTACK não está ativado
	prepare,								/// ATTACK está sendo preparado
	wait,									/// ATTACK está esperando por oportunidade
	ing										/// ATTACK está sendo executado
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


/// TEAM FLAG
enum clan {
	c,										/// Flag Clan Computer
	p,										//	Flag Clan Player
}


/// COLOR PALLETE MODE
enum pallete {
	cga_8,									/// 1 - CGA 8 Colors
	cga_4a,									/// 2 - CGA 4 Colors A
	cga_4b,									/// 3 - CGA 4 Colors B
	gb,										/// 4 - Game Boy Classic
	gbca,									/// 5 - Game Boy Color A
	gbcb,									/// 6 - Game Boy Color B
	gbcc,									/// 7 - Game Boy Color C
	gbcd,									/// 8 - Game Boy Color D
	ega_8,									/// 0 - EGA 8 Colors
	binary									/// 0 - Binary A
}


enum msg {
	pt,	
	en,
	press_start,
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
	beta
}

#macro	install_speak					self.speak_finish=0;self.speak_init=0;self.speak_mode=0;self.speak_text="";self.speak_step=0
