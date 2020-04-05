/// @description ev_interact_message

if game.app.player.state == fsm_player.sleep then 
	self.message = t(msg.interact_sit_up)
else
	self.message = t(msg.interact_sleep_down)