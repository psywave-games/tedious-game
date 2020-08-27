/// @description Insert description here
// You can write your code in this editor


#region RESOLUTIONS
/// resoluções pré defefinidas
self.resolutions = [
	160,
	240,
	360,
	640,
	720,
	768,
	900,
	1024,
	1080,
	1144,
	1360,
	1440,
	2160
]

/// proporçoes pré definidas
self.name_ratio = [ 
	"4:3 (Mobile)",
	"1:1 (Mobile)",
	"1:1",
	"4:3",
	"16:9",
	"21:9",
	"32:9",
]

/// para uso de troca de solução
self.size_ratio = [
	0.65555555,
	0.50000000,
	1.00000000,
	1.33333333,
	1.77777778,
	2.33333333,
	3.55555556,
]
#endregion

#region PREPARE CONFIGS
/// resolução selecionada
self.mode_fullscreen_web = false
self.mode_resolution = 5
self.mode_ratio = 3
self.mode_light_hd = true
self.mode_outline = true
self.mode_reflex = true
self.mode_debug = 0
self.mode_font_hd = true
self.mode_camera = 0
self.font_speed = 3
self.color_invert = 0
self.color_darkness = 0.6
#endregion

///	posicionamento da camera no mapa
self.camx = 0
self.camy = 0
self.camwait = false

self.background = -1
self.surface_darkness = 0

alarm_set(ev_init,1)