if light_force <= 0 then 
	exit

#region LIGHTS HD
if not lite() and game.app.render.mode_light_hd begin
	#region SURFACE DRAW|UPDATE
	var width = light_force * 2
	var middle = width/2
	if not surface_exists(surface_light) or not surface_exists(surface_brightness) begin
			
		if surface_exists(surface_brightness) then
			surface_free(surface_brightness)
			
		if surface_exists(surface_light) then
			surface_free(surface_light)
			
		surface_brightness = surface_create(width, word.height)
		surface_light = surface_create(width, word.height)

		#region DRAW LIGHT
		surface_set_target(surface_light)
		draw_set_blend_mode(bm_max)
		draw_sprite_ext(Sglow, 0, middle, 0, 0.28, 0.28, 0, c_white, 1.0)
		draw_set_blend_mode(bm_normal)
		surface_reset_target()
		#endregion
		#region DRAW BRIGHTNESS
		surface_set_target(surface_brightness)
		draw_circle_color(middle, 0, light_force, c_white, c_black, false)
		surface_reset_target()
		#endregion
		#region RAYTRACER
		with obj_door0 begin
			
			/// porta do lado esquerdo
			var _xx1 = middle - (other.x - self.x)
			var _xx2 = width
			var _yy = self.state != fsm_mob.running? word.height: 21
			
			/// porta do lado direito
			if _xx1 < middle begin
				_xx2 = _xx1 - real(!browser())
				_xx1 = 0
			end
		
			/// desenhar recorte
			if abs(other.x - self.x) < middle 
				and abs(other.y - self.y) < word.height
				and other.y < self.y begin
				draw_set_alpha(1.0)
				
				surface_set_target(other.surface_light)
				gpu_set_blendmode(bm_subtract)
				draw_rectangle(_xx1, 0, _xx2, _yy, false)
				gpu_set_blendmode(bm_normal)
				surface_reset_target()
				
				surface_set_target(other.surface_brightness)
				gpu_set_blendmode(bm_subtract)
				draw_rectangle(_xx1, 0, _xx2, _yy, false)
				gpu_set_blendmode(bm_normal)
				surface_reset_target()
			end
		end		
		#endregion
	end
	#endregion 
	#region RENDER SURFACE
	if surface_exists(surface_light) and surface_exists(surface_brightness) begin
		#region LIGHT
			gpu_set_blendmode(bm_add)
			draw_set_alpha(light_alpha)
			draw_surface(surface_brightness, x - middle, y - 1)
			draw_set_alpha(1.0)
			if light_force >= light_size begin
				draw_surface(surface_light, x - middle, y - 1)
			end
			gpu_set_blendmode(bm_normal)
		#endregion
		#region DARKNESS
		if surface_exists(game.app.render.surface_darkness) begin
			surface_set_target(game.app.render.surface_darkness)
			gpu_set_blendmode(bm_subtract)
			draw_surface(surface_brightness, x - middle, y - 1)
			gpu_set_blendmode(bm_normal)
			surface_reset_target()
		end
		#endregion
	end
	#endregion
end
#endregion
#region LIGHTS LITE
else if lite() begin
	draw_set_alpha(0.64)
	draw_set_color(c_white)
	var _in = lerp(0, 8, light_force/max(light_size, 1))
	draw_triangle(x, y, x - _in, y + _in/2, x + _in, y + _in/2, false)
	draw_set_alpha(1.0)
end
#endregion
#region LIGHTS SIMPLE
else begin
	gpu_set_blendmode(bm_add)
	var _in = lerp(0, 6, light_force/max(light_size, 1))
	draw_set_alpha(0.64)
	draw_trapeze_color(bbox_left + 1, y, bbox_right - 1, y, bbox_left - _in + 1, y + _in, bbox_right + _in, y + _in, c_white, c_white, c_black, c_black, false)
	draw_set_alpha(1.0)
	gpu_set_blendmode(bm_normal)
end
#endregion