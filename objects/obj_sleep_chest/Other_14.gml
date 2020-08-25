/// @description ev_interact_message 
switch self.select begin

	case 1:
		self.message = text_interact(t(msg.interact_bible))
		break
		
	case 2:
		if self.state == fsm_mob.idle then
			self.message = text_interact(t(msg.interact_on), t(msg.psy_light))

		else 
			self.message = text_interact(t(msg.interact_off), t(msg.psy_light))
end


self.message += text_switch(1, broken? 1: 2)