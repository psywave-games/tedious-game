draw(
	spr_bath_mirror0, color_cinza_c,
	spr_bath_mirror1, color_azul_a
)

#region REFLEX
if reflex_world begin 

	var surface_player = surface_create(10, 13)
	if (surface_exists(surface_player)) begin
		var _xx = 8 - (game.app.player.x - self.x)/1.4
		var _yy = 8 + (game.app.player.y - self.y)/4
		
		surface_set_target(surface_player)
	
		draw_clear_alpha(c_black, 0);
		
		
		p_draw_reflex(_xx, _yy, -1.0, 1.0, 0.64)
	
		surface_reset_target()
	
		draw_surface(surface_player,x-5,y-6)
	
		surface_free(surface_player)
	end

end
#endregion	