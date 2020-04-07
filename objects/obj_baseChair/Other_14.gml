/// @description ev_interact_message

if game.app.player.state == fsm_player.sit then 
	self.message = text_interact(t(msg.interact_sit_up))
else
	self.message = text_interact(t(msg.interact_sit_down), self.name)