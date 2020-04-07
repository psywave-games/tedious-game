/// @description ev_interact_message

/// Fogão desligado
if self.state == fsm_mob.idle and not gas then
	self.message = text_interact(t(msg.interact_furnace_gas))

else if self.state == fsm_mob.idle and gas then
	self.message = text_interact(t(msg.interact_furnace_fire))
	
/// Fogão ligado
else switch self.select begin
	case 1:
		self.message = text_interact(t(msg.interact_furnace_off)) + text_switch(1,2)
		break

	case 2:
		if not hurt then
			self.message = text_interact(t(msg.interact_furnace_hurt)) + text_switch(1,2)
		else 
			self.message = text_interact(t(msg.interact_furnace_down)) + text_switch(1,2)
		break
end