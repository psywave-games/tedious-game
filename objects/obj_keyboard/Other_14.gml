/// @description ev_interact_message

if state != fsm_mob.running then
	self.message = text_interact(t(msg.interact_music_2009))
	
else 
	self.message = "OFF"