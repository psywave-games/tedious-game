/// @description ev_interact_broken

score_add(-100)
	
with instance_nearest(x, y - 16, obj_baseLamp) begin
	self.state = fsm_mob.broken
end