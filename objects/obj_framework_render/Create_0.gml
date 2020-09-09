self.doors = 0
self.quality = 0
self.background = -1
self.surface_darkness = 0
self.resolution = "#error_resolution_unknown"

///	posicionamento da camera no mapa
self.camx = 0
self.camy = 0
self.camwait = false

#region RESOLUTIONS
self.name_resolution = [
	"#error_resolution_internal_access",
	"160p",
	"240p",
	"360p",
	"640p",
	"HD 720p",
	"HD 728p",
	"HD+ 800p",
	"HD+ 900p",
	"HD+ 1024p",
	"FullHD 1080p",
	"FullHD 1144p",
	"FullHD 1360p",
	"QuadHD 1440p",
	"UltraHD 4K",
	"UltraHD 5K",
	"UltraHD 6K",
	"UltraHD 8K",
	"UltraHD 16K"
]
/// resoluções pré defefinidas
self.size_resolution = [
	720,
	160,
	240,
	360,
	640,
	720,
	768,
	800,
	900,
	1024,
	1080,
	1144,
	1360,
	1440,
	2160,
	2880,
	3456,
	4320,
	8640,
]

/// proporçoes pré definidas
self.name_ratio = [ 
	"Mobile",
	"Auto",
	"1:1",
	"4:3",
	"16:9",
	"21:9",
	"32:9",
	"4:1",
	"Full"
]

/// para uso de troca de solução
self.size_ratio = [
	0.00000000,
	0.00000000,
	1.00000000,
	1.33333333,
	1.77777778,
	2.33333333,
	3.55555556,
	4.00000000,
	0.00000000,
]
#endregion
#region CONFIGS
self.mode_fullscreen_web = true
self.mode_resolution = 0
self.mode_ratio = 1
self.mode_shadow_hd = true
self.mode_light_hd = true
self.mode_outline = true
self.mode_reflex = true
self.mode_debug = 0
self.mode_font_hd = true
self.mode_camera = 0
self.mode_safe = true
self.mode_particles = true
self.mode_emu_lite = 0
self.mode_emu_browser = 0
self.font_speed = 3
self.color_invert = 0
self.color_darkness = 0.6
#endregion

self.internal_old_width = 0
self.internal_old_height = 0

if display_get_orientation() == display_portrait
	or  display_get_orientation() == display_portrait_flipped
	or display_get_width() < display_get_height() begin
	self.mode_ratio = 0
end

draw_set_circle_precision(64)