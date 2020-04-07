/// @description ev_interact_message

with game.app.interface begin

	if game.app.player.y >= 230.0 then
		self.message = self.message + "[W] " + t(msg.interact_stair_up) + "\n"
	
	else 
		self.message = self.message + "[S] "+ t(msg.interact_stair_down) + "\n"
	
	self.can_interact |= true
end
