/// @description ev_interact_using

with game.app.player begin

	/// terminou de cagar
	if self.state == fsm_player.sit  and self.requirements[need.food] >= 99 begin
		speak(self, t(msg.interact_rate_refreshed))
		score_add(100)
		self.state = fsm_player.idle
	end

	/// terminou de mijar
	if self.state == fsm_player.piss and self.requirements[need.water] >= 99 begin
		speak(self, t(msg.interact_rate_refreshed))
		score_add(100)
		self.state = fsm_player.idle
	end
end