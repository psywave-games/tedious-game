/// @description ev_interact_down


if self.state == fsm_mob.idle and not gas then
	self.gas = true

else if self.state == fsm_mob.idle and gas then
	self.state = fsm_mob.running