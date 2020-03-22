/// @description Insert description here
// You can write your code in this editor


#region PREPARE RESOLUTION
/// resolução selecionada
self.mode_resolution = 2
self.mode_ratio = 1

/// resoluções pré defefinidas
self.resolutions = [
	160,
	360,
	640,
	720,
	1024,
	1360,
	2160
]

/// proporçoes pré definidas
self.name_ratio = [
	"1:1",
	"4:3",
	"16:9",
	"21:9",
	"32:9",
]

/// para uso de troca de solução
self.size_ratio = [
	1.00000000,
	1.33333333,
	1.77777778,
	2.33333333,
	3.55555556,
	
]
#endregion

#region PREPARE CONFIGS
self.colorize = true
self.font_hd = true
self.font_speed = 3
self.camera_speed = 2
self.light_hd = true
#endregion

init