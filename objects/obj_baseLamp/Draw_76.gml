/// light off
if self.state != fsm_mob.running then
	self.light_force = 0	

/// light on
else self.light_force = min(self.light_force + 12, light_size)