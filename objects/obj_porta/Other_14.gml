/// @description ev_interact_message

if self.state == fsm_mob.idle then
	self.message = t(msg.interact_open) + " " + t(msg.psy_door)

else 
	self.message = t(msg.interact_close) + " " + t(msg.psy_door)
