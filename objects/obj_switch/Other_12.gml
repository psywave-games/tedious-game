/// @description ev_interact_up

state = fsm_mob.idle

with instance_nearest(x, y - 16, obj_baseLamp) begin
	self.state = fsm_mob.idle
end