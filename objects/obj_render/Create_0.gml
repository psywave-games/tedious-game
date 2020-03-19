/// @description Insert description here
// You can write your code in this editor

#region INIT PALLETE
game.app.color = array_create(16, c_fuchsia)
self.mode = 0
self.names = [
	"CGA 8 Colors",
	"CGA 4 Colors A",
	"CGA 4 Colors B",
	"Game Boy Classic",
	"Game Boy Color A",
	"Game Boy Color B",
	"Game Boy Color C",
	"Game Boy Color D",
	"EGA 8 Colors",
	"Binary A"
]

self.sprites = [
	spr_iron0,
	spr_lapide,
	spr_grass,
	spr_fence,
	spr_iron1,
	spr_wall
]

self.layers = array_create(2, -1)
#endregion

#region PREPARE RESOLUTION
/// resolução selecionada
self.mode_resolution = 1
self.mode_ratio = 1

/// resoluções pré defefinidas
self.resolutions = [
	360,
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
]

/// para uso de troca de solução
self.size_ratio = [
	1.00000000,
	1.33333333,
	1.77777778,
	2.33333333
]
#endregion

#region PREPARE CONFIGS
self.colorize = true
self.font_hd = true
self.font_speed = 3
#endregion

init

