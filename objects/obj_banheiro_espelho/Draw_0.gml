draw_self()

if (playercollision) { 

	var surface_player = surface_create(sprite_width, sprite_height)
	if (surface_exists(surface_player)) {
		var _xx = 6 - (game.app.player.x - self.x)
		var _yy = 8 + (game.app.player.y - self.y)/4
		var _sign = sign(game.app.player.x - self.x)
		
		surface_set_target(surface_player)
	
		draw_clear_alpha(c_black, 0);
		
		
		p_draw(_xx, _yy, 0.8 * _sign, 0.8, 0.75)
	
		gpu_set_blendmode(bm_subtract) // draw_set_blend_mode() in GM 1.4
		draw_sprite(spr_espelho0,1,0,0) // this has the image we want to blank out
		gpu_set_blendmode(bm_normal)

		surface_reset_target()
	
		draw_surface(surface_player,x-8,y-8)
	
		surface_free(surface_player)
	}

}
	