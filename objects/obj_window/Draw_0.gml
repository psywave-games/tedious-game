if image_index > 6 and state == fsm_mob.running then
	image_index = 6
	
if image_index < 1 and state == fsm_mob.idle then
	image_index = 1

#region REFLEX
if reflex_world begin 
	
	var surface_player = surface_create(22, 22)
	if (surface_exists(surface_player)) begin
		var _xx = 11 + game.app.player.x - self.x
		var _yy = 11 + (game.app.player.y - self.y)/4
		var _sign = (0.8)/clamp(image_index, 1, 2)
		
		surface_set_target(surface_player)
	
		draw_clear_alpha(c_black, 0);
		
		w_draw_reflex(x, y, _sign, 0.8, 0.32, 5, -11, reflex_mobs)
		if reflex_player then 
			p_draw_reflex(_xx, _yy, _sign, 0.8, 0.32)
	
		gpu_set_blendmode(bm_subtract) 
	
		if image_index > 1 then
			draw_rectangle(11 - image_index, 0, 10 + image_index, 22, false)
	
		gpu_set_blendmode(bm_normal)
		surface_reset_target()
	
		draw_surface(surface_player, x - 11, y - 9)
	
		surface_free(surface_player)
	end
end
#endregion	

draw(
	sprite_index, color_verde_b
)