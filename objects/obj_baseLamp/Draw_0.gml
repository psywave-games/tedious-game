if self.state == fsm_mob.running and not lite() begin
	#region SURFACE DRAW LIGHT
	var width = light_force * 2
	var middle = width/2
	var surface_light = surface_create(width, word.height)
	
	if surface_exists(surface_light) begin
		#region SURFACE PREPARE
		surface_set_target(surface_light)
		draw_clear_alpha(c_black, 0)
		draw_set_alpha(1.0)
		#endregion
		#region DRAW LIGHT
		draw_set_color(c_white)
		draw_circle_color(middle, 0, light_force, c_white, c_black, false)
		#endregion
		#region RAYTRACER
		gpu_set_blendmode(bm_subtract)
		with instance_nearest(x, y, obj_door0) begin
			
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
				and other.y < self.y then
				draw_rectangle(_xx1, 0, _xx2, _yy, false)
		end
		surface_reset_target()
		gpu_set_blendmode(bm_normal)
		#endregion
		#region SURFACE RENDER
		gpu_set_blendmode(bm_add)
		draw_set_alpha(lerp(0.3, 0.75, game.app.render.color_darkness/2))
		draw_surface(surface_light, x - middle, y - 1)
		draw_set_alpha(1.0)
		gpu_set_blendmode(bm_normal)
		#endregion
		#region DARKNESS REMOVE
		if surface_exists(game.app.render.surface_darkness) begin
			surface_set_target(game.app.render.surface_darkness)
			gpu_set_blendmode(bm_subtract)
			draw_surface(surface_light, x - middle, y - 1)
			gpu_set_blendmode(bm_normal)
			surface_reset_target()
		end
		#endregion
		surface_free(surface_light)
	end
	#endregion
end