#region COUNT
self.step += 1

if self.state == fsm_game.play
	or self.state == fsm_game.insider begin

	self.step_play += 1

	if self.happy > 0 and not (self.step_play % room_speed) then
		self.happy -= game.app.player.darkness > 0.5? 1.0: 0.5
end
#endregion

#region GAME OVER
if p_exists() then
	if game.app.player.state == fsm_player.died and game.app.state == fsm_game.play then
		event_user(ev_mygame_end)
#endregion

#region CLOCK
if not (self.step % (room_speed * 2)) and self.state == fsm_game.play begin
	self.clock_minute += 1

	if self.clock_minute >= 60 begin
		self.clock_minute = 0
		self.clock_hour += 1
	end
	
	if self.clock_hour >= 24 then
		self.clock_hour = 0
end
#endregion