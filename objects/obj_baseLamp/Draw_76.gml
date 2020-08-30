#region SIZE LIGHT
/// light off
if self.state != fsm_mob.running then
	self.light_force = 0	

/// light on
else self.light_force = min(self.light_force + 12, light_size)
#endregion
#region DYNAMIC|STATIC|CACHE|FLUSH LIGHT CONTROLLER
if not lite() and self.can_surface begin
    if surface_exists(self.surface_light) then if not game.app.render.mode_light_hd 
            or self.state == fsm_mob.running and self.internal_doors_bitwise_old != game.app.render.doors
            or self.state == fsm_mob.running and self.internal_light_force_old != self.light_force
            or self.state != fsm_mob.running begin
            
		surface_free(self.surface_light) 
		self.surface_light = null_surface
    end
    
    if surface_exists(self.surface_brightness) then	if not game.app.render.mode_light_hd 
            or self.state == fsm_mob.running and self.internal_doors_bitwise_old != game.app.render.doors
            or self.state == fsm_mob.running and self.internal_light_force_old != self.light_force
            or self.state != fsm_mob.running begin
            
        surface_free(self.surface_brightness)
        self.surface_brightness = null_surface
    end
end

self.internal_light_force_old = self.light_force
self.internal_doors_bitwise_old = game.app.render.doors
#endregion