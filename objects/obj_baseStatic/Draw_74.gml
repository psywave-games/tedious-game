/// @description Outline
if surface_exists(surface_outline) begin
	draw_set_blend_mode(bm_add)
	var _center = surface_get_width(surface_outline)/2
	var _middle = surface_get_height(surface_outline)/2
	var _sx = display_get_gui_width()/camera_get_view_width(view_camera[0])
	var _sy = display_get_gui_height()/camera_get_view_height(view_camera[0])
	var _xx = ((x - _center + 1) - game.app.render.camx) * _sx
	var _yy = ((y - _middle + 1) - game.app.render.camy) * _sy
	draw_surface_ext(surface_outline, _xx, _yy, _sx, _sy, 0, c_white, lerp(0.16, 0.64, anim_fadetent(game.app.step, 0, room_speed/2, room_speed/4)))
	draw_set_blend_mode(bm_normal)
end