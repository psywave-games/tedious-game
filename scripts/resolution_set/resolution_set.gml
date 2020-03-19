/// @arg mode_resolution
/// @arg mode_ratio

var _mode_resolution = argument0 
var _mode_ratio = argument1

game.app.render.mode_resolution = _mode_resolution
game.app.render.mode_ratio = _mode_ratio

var resolution_height= game.app.render.resolutions[_mode_resolution]
var resolution_width = round(game.app.render.size_ratio[_mode_ratio] * resolution_height)

var camera_width = round(game.app.render.size_ratio[_mode_ratio] * 512)
var camera_width = clamp(512, 512, room_width)
var camera_height = clamp(512, 512, room_height)

/// ajustar resolução para ser divisvel por 8
while resolution_width % 8 begin 
	resolution_width += 1
end
while camera_width % 8 begin 
	camera_width += 1
end

view_visible[0] = true
view_enabled = true

view_set_wport(0, camera_width)
view_set_hport(0, camera_height)

// não utilizado:
camera_set_view_size(view_camera[0], camera_width, camera_height)

display_set_gui_size(resolution_width, resolution_height)
window_set_size(resolution_width, resolution_height)
		