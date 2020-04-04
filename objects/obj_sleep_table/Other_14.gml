/// @description ev_interact_message 
switch self.select begin

	case 1:
		if self.state == fsm_mob.idle then
			self.message = t(msg.interact_on) + " " + t(msg.psy_computer)

		else 
			self.message = t(msg.interact_off) + " " + t(msg.psy_computer)
		break

	case 2:
		self.message = t(msg.interact_book)
		break
		
	case 3:
		self.message = t(msg.interact_google)
		break
end

text_switch(1,3)