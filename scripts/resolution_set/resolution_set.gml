/// @arg mode_resolution
/// @arg mode_ratio

var _mode_resolution = argument0 
var _mode_ratio = argument1

game.app.render.mode_resolution = _mode_resolution
game.app.render.mode_ratio = _mode_ratio

var resolution_height= game.app.render.resolutions[_mode_resolution]
var resolution_width = round(game.app.render.size_ratio[_mode_ratio] * resolution_height)
var camera_width = game.app.render.size_ratio[_mode_ratio] * word.height

/// ajustar resolução para ser divisvel por 8
while resolution_width % 8 begin 
	resolution_width = round(resolution_width + 1)
end

while camera_width % 8 begin 
	camera_width = round(camera_width + 1)
end

view_visible[0] = true
view_enabled = true


#region AJUST GUI SIZE
var gui_width = resolution_width
var gui_height = resolution_height 

if gui_width <= 640 then
	gui_width = 720

if gui_height <= 640 then
	gui_height = 720

display_set_gui_size(gui_width, gui_height)
#endregion

#region AJUST RESOLUTION
/// Camera
if room == rm_intro then
	camera_set_view_size(view_camera[0], room_width, room_height)

else 
	camera_set_view_size(view_camera[0], camera_width, word.height)

/// Janela
window_set_size(resolution_width, resolution_height)
#endregion


#region CENTER BROWSER WINDOW
if os_browser != browser_not_a_browser begin
	/// ajustar fullscreen
	if global.fullscreen_web begin
		window_set_size(browser_width, browser_height)
		window_set_position(0,0)
	end
	
	/// ajustar bordas
	else begin
		var min_x = (browser_width - resolution_width) / 2
		var min_y = (browser_height - resolution_height) / 2

		window_set_position(min_x, min_y)
	end
end
#endregion

window_set_colour(c_black)
draw_clear_alpha(c_black, 1.0)