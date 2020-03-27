/// @description ev_interact_down

state = fsm_mob.running

with instance_nearest(x, y - 16, obj_baseLamp) begin
	self.state = fsm_mob.running
end