/// @arg mode_resolution
/// @arg mode_ratio

var _mode_resolution = argument0 
var _mode_ratio = argument1

var _mobile = _mode_ratio == 0
var _ratio_auto = _mode_ratio == 1
var _ratio_full = _mode_ratio == last_ratio
var _resolution_auto = _mode_resolution == 0 or _mobile
var _display_height = is_browser? browser_height: display_get_height()
var _display_width = is_browser? browser_width: display_get_width()
var _resolution_height = 720
var _resolution_width = 720

#region CREATE RESOLUTION
if _ratio_full begin
	var _ratio = room_width/word.height
	_resolution_height = game.app.render.size_resolution[_mode_resolution]
	_resolution_width = _resolution_height * _ratio	
end
else if _mobile begin
	var _ratio = _display_height >= _display_width? _display_height/_display_width:  _display_width/_display_height
	_resolution_width = game.app.render.size_resolution[_mode_resolution]
	_resolution_height =  _resolution_width * _ratio
end
else if _ratio_auto and not _resolution_auto begin
	var _ratio = _display_height >= _display_width? _display_height/_display_width:  _display_width/_display_height
	_resolution_height = game.app.render.size_resolution[_mode_resolution]
	_resolution_width = _resolution_height * _ratio	
end
else if not _ratio_auto and not _resolution_auto begin 
	_resolution_height = game.app.render.size_resolution[_mode_resolution]
	_resolution_width = _resolution_height * game.app.render.size_ratio[_mode_ratio]
end
else if _ratio_auto and _resolution_auto begin
	for (var j = last_resolution; j > 1; j--) begin 
		if _display_height > game.app.render.size_resolution[j] then
			break 
	end
	return resolution_set(clamp(j, 1, last_resolution), _mode_ratio)
end
#endregion
#region SAFE MODE
if game.app.render.mode_safe begin
	if is_browser and not game.app.render.mode_fullscreen_web or not is_browser then 
		if _display_height < _resolution_height or _display_width < _resolution_width begin	
			if _mode_resolution <= 0 then
				return false
		
		return resolution_set(_mode_resolution - 1, _mode_ratio)
	end
	if is_smartphone begin
		if is_browser then 
			 game.app.render.mode_fullscreen_web = true
		
		if _mode_resolution != 0 then
			return false
	end
end
#endregion


var _diplay_ratio = _resolution_width/_resolution_height
var _camera_ratio = _mobile? (_resolution_width/(_resolution_height/2)): _diplay_ratio
var _camera_width = word.height * _camera_ratio


if _mobile then while _resolution_height % 8 begin 
	_resolution_height = round(_resolution_height + 1)
end

else while _resolution_width % 8 begin 
	_resolution_width = round(_resolution_width + 1)
end

while _camera_width % 8 begin 
	_camera_width = round(_camera_width + 1)
end

#region AJUST GUI SIZE
var gui_width = _resolution_width
var gui_height = _resolution_height 

if gui_width <= 640 then
	gui_width = 720

if gui_height <= 640 then
	gui_height = 720

display_set_gui_size(gui_width, gui_height)
#endregion

#region AJUST RESOLUTION
camera_set_view_size(view_camera[0], _camera_width, word.height)
window_set_size(_resolution_width, _resolution_height)
#endregion

#region CENTER WINDOW
if is_browser begin
	/// ajustar a tela
	if game.app.render.mode_fullscreen_web begin
		window_set_size(browser_width, browser_height)
		window_set_position(0,0)
	end
	/// centralizar horizontal
	else if _mobile begin 
		window_set_position((browser_width - _resolution_width)/2, 0)
	end
	/// centralizar vertical e horizontal
	else begin
		var min_x = (browser_width - _resolution_width) / 2
		var min_y = (browser_height - _resolution_height) / 2
		window_set_position(min_x, min_y)
	end
end
else window_center()
#endregion

#region VIEW SIZE
view_enabled = true
view_set_visible(0, true)
view_set_wport(0, _display_width)
view_set_hport(0, _mobile?  _display_height/2: _display_height)

view_set_visible(1, _mobile)
view_set_wport(1, 1)
view_set_hport(1, _display_height)
#endregion

#region CLEAR
window_set_colour(c_black)
draw_clear_alpha(c_black, 1.0)
#endregion 

#region SAVE
game.app.render.mode_resolution = _mode_resolution
game.app.render.mode_ratio = _mode_ratio
#endregion
#region NAME
if _ratio_auto or _mobile then
	game.app.render.resolution = game.app.render.name_resolution[_mode_resolution]
else
	game.app.render.resolution = string(round(_resolution_width)) + "x" + string(round(_resolution_height))
#endregion

return true