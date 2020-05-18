/// @description ev_interact_message

/// ligar chuveiro
if self.state == fsm_mob.idle then
	self.message = text_interact(t(msg.interact_on), t(msg.psy_shower))
	
/// sair do banho
else if game.app.player.state == fsm_player.shower then
	self.message = text_interact(t(msg.interact_shower_up))
	
/// chuveiro ligado
else switch self.select begin

	/// delisgar chuveiro
	case 1:
		self.message =  text_interact(t(msg.interact_off), t(msg.psy_shower))
		break
	

	/// tomar banho
	case 2:
		self.message = text_interact(t(msg.interact_shower_down))
		break
end