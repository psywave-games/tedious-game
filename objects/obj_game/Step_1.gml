#region COUNT
self.step += 1

if self.state == fsm_game.play begin

	self.step_play += 1

	if self.happy > 0 and not (self.step_play % room_speed) then
		self.happy -= 1
end
#endregion

#region GAME OVER
if game.app.player.state == fsm_player.died and game.app.state == fsm_game.play begin
	time_speedrun_end = current_time
	state_reset(game.app, fsm_game.over)
end
#endregion