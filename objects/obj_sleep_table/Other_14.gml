/// @description ev_interact_message 
var _last = self.state != fsm_mob.running? 2: 3 

switch self.select begin

	case 1:
		if self.state == fsm_mob.idle then
			self.message = text_interact(t(msg.interact_on), t(msg.psy_computer))

		else 
			self.message = text_interact(t(msg.interact_off), t(msg.psy_computer))
		break

	case 2:
		self.message = text_interact(t(msg.interact_book))
		break
		
	case 3:
		self.message = text_interact(t(msg.interact_google))
		break
end

self.message = self.message + text_switch(1, _last)