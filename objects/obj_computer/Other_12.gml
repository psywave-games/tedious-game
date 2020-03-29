/// @description ev_interact_up

if select == 1 then
	self.state = fsm_mob.idle
else 
	event_user(ev_interact_down)