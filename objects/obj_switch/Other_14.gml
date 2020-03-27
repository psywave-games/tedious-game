/// @description ev_interact_message

if state == fsm_mob.idle then
	message = t(msg.interact_on) + " " + t(msg.psy_light)

else 
	message = t(msg.interact_off) + " " + t(msg.psy_light)