var _HD = game.app.render.mode_light_hd
var _lite = lite()

draw(
	spr_tv_table0, color(color_marrom_a),
	spr_tv_table1, state == fsm_mob.running? c_white: color(color_cinza_d),
	spr_tv_table2, color(color_cinza_c)
)


#region LIGHT
if state == fsm_mob.running and light_force <= light_size begin
	var _yy = y - 3
	var _decrx = image_xscale * 4
	var _incrx = image_xscale * -10
	var _incry = image_yscale * 7
	var _color = not _lite? c_black: c_white
	
	if not _lite then draw_set_blend_mode(bm_add)
	draw_set_alpha(choose(0.7, 0.96, 0.96, 0.96, 0.64))
	draw_triangle_color(x + _decrx, _yy, x + _incrx, _yy - _incry, x + _incrx, _yy + _incry, c_white, _color, _color, false)
	if not _lite then draw_set_blend_mode(bm_normal)
end
#endregion

draw_sprite_ext(spr_tv_table2, 0, x, y, image_xscale, image_yscale, image_angle, color(color_cinza_c), 1.0)

#region DARNKNESS
if _HD and surface_exists(game.app.render.surface_darkness) begin
	surface_set_target(game.app.render.surface_darkness)
	draw_set_blend_mode(bm_subtract)
	draw_circle_color(x, y, light_force, c_white, c_black, false)
	surface_reset_target()
	draw_set_blend_mode(bm_normal)
end
#endregion