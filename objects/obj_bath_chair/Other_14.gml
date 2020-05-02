/// @description ev_interact_message

/// levantar do vaso
if game.app.player.state == fsm_player.sit then 
	self.message = text_interact(t(msg.interact_shit_up))
	
/// levantar tampa do vaso
else if self.state == fsm_mob.idle then
	self.message = text_interact(t(msg.interact_toilet_down))
	
else switch select begin

	/// abaixar tampa do vazo
	case 1:
		self.message = text_interact(t(msg.interact_toilet_up))
		break
		
	/// cagar no vaso
	case 2:
		self.message = text_interact(t(msg.interact_shit_down))
		break

	/// mijar no vaso
	case 3:
		self.message = text_interact(t(msg.interact_urine_down))
		break
end


if state == fsm_mob.running then
	self.message += text_switch(1, 3)