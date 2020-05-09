/// @description ev_interact_message


if self.state == fsm_mob.idle then
	self.message = text_interact(t(msg.interact_on), t(msg.psy_tv))

else switch self.select begin
	case 1:
		self.message = text_interact(t(msg.interact_off), t(msg.psy_tv)) + text_switch(1,2)
		break
		
	case 2:
		self.message = text_interact(t(msg.interact_videogame)) + text_switch(1,2)
		break

end


	