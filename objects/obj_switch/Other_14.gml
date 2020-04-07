/// @description ev_interact_message

if self.state == fsm_mob.idle then
	self.message = text_interact(t(msg.interact_on), t(msg.psy_light))

else 
	self.message = text_interact(t(msg.interact_off), t(msg.psy_light))