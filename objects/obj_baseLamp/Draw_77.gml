if game.app.render.mode_light_hd and surface_exists(surface_light) begin

	if state == fsm_mob.running and internal_doors_bitwise_old != game.app.render.doors
		or state == fsm_mob.running and internal_light_force_old != light_force
		or state != fsm_mob.running begin
	
		surface_free(surface_light) 
	
		if surface_exists(surface_brightness) then
			surface_free(surface_brightness)
	end

	internal_light_force_old = light_force
	internal_doors_bitwise_old = game.app.render.doors
end