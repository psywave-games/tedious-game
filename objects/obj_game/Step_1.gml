self.step += 1

if self.state == fsm_game.play begin

	self.step_play += 1
	self.time_speedrun_init += 1

	if self.happy > 0 and not (self.step_play % room_speed) then
		self.happy -= 1
end