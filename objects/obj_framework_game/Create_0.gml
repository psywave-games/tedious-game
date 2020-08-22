#region CREATE INSTANCE SINGLETON MODE
if instance_number(self.object_index) > 1 begin
	instance_destroy()
end

global.app = self.id
#endregion

#region RANDOMIZE
random_set_seed(randomize())
#endregion

#region INSTANCE VARIABLES 
/// Jogador
self.player = 0


/// Steps
self.step = 0
self.step_play = 0


/// Verifica se o jogo foi iniciado
self.started = false


/// Idioma do jogo (old)
self.lang = 0

/// Faz a camera tremer (unusued)
self.earthquake = 0


/// Nivel de felicidade do jogador
self.happy = 100


/// Nome do jogador
self.nickname =	""

/// Horário
self.clock_hour = 23
self.clock_minute = 10

global.eula = false
global.language = "pt"
#endregion

#region INIT FINITE SATE MACHINE

/// @see				controla o padrão comportamental do estado de jogo
/// @pattern			Finite State Machine
/// @example			game.app.state 
/// @return fsm_game	estado comportamental do jogo
state = fsm_game.load
#endregion

#region INIT INPUT
/// @see				controles do jogo
/// @pattern			singleton
/// @example			game.app.input.menu[key_enter]
/// @return object		instancia do obj_input
self.input = instance_create_layer(x,y, "Instances", obj_framework_input)
#endregion 

#region INIT AUDIO
/// @see				estabelece sons do jogo
/// @pattern			singleton
/// @example			game.app.audio.volume
/// @return object		instancia do obj_audio
audio = instance_create_layer(x,y, "Instances", obj_framework_audio)

#endregion

#region INIT RENDER 
/// @see				estabelece as cores do jogo
/// @pattern			singleton
/// @example			game.app.render.light_hd
/// @return object		instancia do obj_display
self.render = instance_create_layer(x,y, "Instances", obj_framework_render)
#endregion

#region INIT INTERFACE
///////
/// @see				controle de menus do jogo (depedente do game.app.state)
/// @pattern			singleton
/// @example			game.app.mediator.player.[0].state
/// @return object		instancia do obj_menu
interface = instance_create_layer(x,y, "Instances", obj_framework_interface)

#endregion

#region INIT MEMENTO
/// @see				controle de continuidade ao estados anterires do jogo
/// @pattern			mementum
/// @example			comming...
/// @return array		estados anteriores de game.app.state
memento = ds_list_create()
#endregion

#region INIT INVENTORY
global.inventory = instance_create_layer(x,y, "Instances", obj_inventory)

#endregion

#region INIT VIDEOGAMES
self.videogames = [
	instance_create_layer(x,y, "Instances", obj_game_asteroids),
	instance_create_layer(x,y, "Instances", obj_game_invanders)
]

self.select = 0
#endregion

#region INIT EASTEREGGS
fun = instance_create_layer(x,y, "Instances", obj_framework_surprises)
#endregion

alarm_set(ev_init, 2)