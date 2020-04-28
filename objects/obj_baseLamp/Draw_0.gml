if self.state == fsm_mob.running and not lite() begin

	if game.app.player.yfoot >= self.y then
		draw_lensflare(x, y + 2, word.height* 1.4, 0.08, 0.08, 0, choose(3,4,5), 0.5)

	var width = 128
	var middle = width/2
	var surface_light = surface_create(width, word.height)
	
	if surface_exists(surface_light) begin
	
		/// init surface
		surface_set_target(surface_light)
		draw_clear_alpha(c_black, 0);	
		
		/// draw light
		draw_set_alpha(0.8)
		draw_set_color(c_white)
		draw_circle_color(middle, 0, 64, c_white, c_black, false)
		
		#region remove door
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
		gpu_set_blendmode(bm_normal)
		#endregion
		
		
		/// draw surface
		gpu_set_blendmode(bm_add)
		surface_reset_target()
		draw_surface(surface_light, x - middle, y - 1)
		surface_free(surface_light)
		gpu_set_blendmode(bm_normal)
	end
end
