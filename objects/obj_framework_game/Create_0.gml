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

state = fsm_game.loading

global.eula = false
global.language = "pt"
global.achiviements = 0
#endregion


#region FRAMEWORK
self.input = instance_create_layer(x,y, "Instances", obj_framework_input)
self.audio = instance_create_layer(x,y, "Instances", obj_framework_audio)
self.render = instance_create_layer(x,y, "Instances", obj_framework_render)
self.interface = instance_create_layer(x,y, "Instances", obj_framework_interface)
self.social = instance_create_layer(x,y, "Instances", obj_framework_social)
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
global.videogame_points = 1100
self.videogames = [
	instance_create_layer(x,y, "Instances", obj_game_asteroids),
	instance_create_layer(x,y, "Instances", obj_game_invanders),
	instance_create_layer(x,y, "Instances", obj_game_pong),	
]

self.in_videogame = 0
#endregion

alarm_set(ev_init, 2)