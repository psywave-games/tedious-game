/// @description construct game.app

#region CREATE INSTANCE SINGLETON MODE

/// @pattern			singleton
///	@see				só ira permitir este objeto ser instanciado uma vez
if variable_global_exists("app") begin
	/// verificado se é conflitante
	instance_destroy(self)	/// auto destruir-se
	exit					/// parar execução
end 

/// @patern				singleton
/// @example			game.app
/// @return	object		ponto global de acesso ao jogo com todas suas dependencias
global.app = self.id
#endregion

#region INSTANCE VARIABLES 
/// @see				Jogador
/// @example			game.app.player.x
/// @return	object		obj_player
self.player = -1

/// @see				contador de steps do jogo
///	@example			game.app.step
/// @return	integer		numero de ticks passados desde de a criação do game
self.step = 0


/// @see				verifica se o jogo foi iniciado
/// @example			game.app.started
/// @return boolean		se o jogo já foi iniciado	
self.started = false


/// @see				idioma do jogo
///	@example			game.app.lang
/// @return	enum		msg.en ou msg.pt
self.lang = msg.pt	


/// @see				faz a camera tremer
///	@example			game.app.earthquake += 5
/// @return	float		força do terremoto
self.earthquake = 0

#endregion

#region INIT FINITE SATE MACHINE

/// @see				controla o padrão comportamental do estado de jogo
/// @pattern			Finite State Machine
/// @example			game.app.state 
/// @return fsm_game	estado comportamental do jogo
state = fsm_game.intro
#endregion

#region INIT INPUT
/// @see				controles do jogo
/// @pattern			singleton
/// @example			game.app.input.menu[key_enter]
/// @return object		instancia do obj_input
self.input = instance_create_layer(x,y, "Instances", obj_input)

keyboard_set_map(ord("W"), vk_up)
keyboard_set_map(ord("A"), vk_left)
keyboard_set_map(ord("S"), vk_down)
keyboard_set_map(ord("D"), vk_right)
#endregion 

#region INIT AUDIO
/// @see				estabelece sons do jogo
/// @pattern			singleton
/// @example			game.app.audio.volume
/// @return object		instancia do obj_audio
audio = instance_create_layer(x,y, "Instances", obj_audio)

#endregion

#region INIT INTERFACE
///////
/// @see				controle de menus do jogo (depedente do game.app.state)
/// @pattern			singleton
/// @example			game.app.mediator.player.[0].state
/// @return object		instancia do obj_menu
interface = instance_create_layer(x,y, "Instances", obj_interface)

#endregion

#region INIT MEMENTO
/// @see				controle de continuidade ao estados anterires do jogo
/// @pattern			mementum
/// @example			comming...
/// @return array		estados anteriores de game.app.state
memento = ds_list_create()
#endregion

install_speak

init