/// light off
if self.state != fsm_mob.running begin
	self.light_force = 0
	
end


/// light on
else begin
	self.light_force = min(self.light_force + 12, light_size)
end