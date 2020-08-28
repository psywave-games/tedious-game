if self.state == fsm_mob.running and not lite() and light_force begin
	#region SURFACE DRAW LIGHT
	var width = light_force * 2
	var middle = width/2
	var surface_light = surface_create(width, word.height)
	var surface_brightness = surface_create(width, word.height)
	
	if surface_exists(surface_brightness) and surface_exists(surface_light) begin
		#region DRAW LIGHT
		surface_set_target(surface_light)
		if light_force >= light_size begin
			draw_set_blend_mode(bm_max)
			draw_sprite_ext(Sglow, 0, middle, 0, 0.28, 0.28, 0, c_white, 1.0)
			draw_set_blend_mode(bm_normal)
		end
		surface_reset_target()
		#endregion
		#region DRAW BRIGHTNESS
		surface_set_target(surface_brightness)
		draw_circle_color(middle, 0, light_force, c_white, c_black, false)
		surface_reset_target()
		#endregion
		#region RAYTRACER
		with obj_door0 begin
			
			/// lado direito
			var _xx1 = middle - (other.x - self.x) - 3
			var _xx2 = width
			var _yy = self.state != fsm_mob.running? word.height: 21
			
			/// lado esquerdo
			if _xx1 < middle begin
				_xx2 = _xx1 + 4
				_xx1 = 0
			end
		
			/// desenhar recorte
			if abs(other.x - self.x) < middle 
				and abs(other.y - self.y) < word.height
				and other.y < self.y begin
				draw_set_alpha(1.0)
				
				surface_set_target(surface_light)
				gpu_set_blendmode(bm_subtract)
				draw_rectangle(_xx1, 0, _xx2, _yy, false)
				gpu_set_blendmode(bm_normal)
				surface_reset_target()
				
				surface_set_target(surface_brightness)
				gpu_set_blendmode(bm_subtract)
				draw_rectangle(_xx1, 0, _xx2, _yy, false)
				gpu_set_blendmode(bm_normal)
				surface_reset_target()
			end
		end		
		#endregion
		#region SURFACE RENDER
		gpu_set_blendmode(bm_add)
		draw_set_alpha(light_alpha)
		draw_surface(surface_brightness, x - middle, y - 1)
		draw_set_alpha(1.0)
		draw_surface(surface_light, x - middle, y - 1)
		gpu_set_blendmode(bm_normal)
		#endregion
		#region DARKNESS REMOVE
		if surface_exists(game.app.render.surface_darkness) begin
			surface_set_target(game.app.render.surface_darkness)
			gpu_set_blendmode(bm_subtract)
			draw_surface(surface_brightness, x - middle, y - 1)
			gpu_set_blendmode(bm_normal)
			surface_reset_target()
		end
		#endregion
		surface_free(surface_brightness)
		surface_free(surface_light)
	end
	#endregion
end