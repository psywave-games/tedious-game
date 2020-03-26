if os_browser == browser_not_a_browser begin
	window_set_fullscreen(argument0)
	exit 
end

global.fullscreen_web = argument0

resolution_set(game.app.render.mode_resolution, game.app.render.mode_ratio)
