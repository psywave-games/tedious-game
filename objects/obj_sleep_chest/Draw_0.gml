draw(
	spr_sleep_chest0, color_marrom_b,
	spr_sleep_chest1, color_vermelho,	
	spr_sleep_chest2, color_vermelho	
)


#region LIGHT
if self.state == fsm_mob.running begin
	draw_set_blend_mode(bm_add)
	draw_set_alpha(light_alpha)
	draw_triangle_color(
	    x - 7,
	    y - 9,
	    x - 15,
	    y - 5,
	    x + 1,
	    y - 5,
		c_white,
		c_black,
		c_black,
	    false
	)
	draw_set_alpha(1.0)
	draw_set_blend_mode(bm_normal)
end
#endregion
#region DARKNESS
if self.state == fsm_mob.running and surface_exists(game.app.render.surface_darkness) begin
	surface_set_target(game.app.render.surface_darkness)
	draw_set_blend_mode(bm_subtract)
	draw_circle_color(x -7, y -11, light_force, c_white, c_black, false)
	surface_reset_target()
	draw_set_blend_mode(bm_normal)
end
#endregion

draw_sprite_ext(spr_sleep_chest3, 
	image_index, 
	x,
	y, 
	image_xscale,
	image_yscale,
	image_angle,
	broken? color(color_cinza_c): color(color_vermelho), 
	image_alpha
)