with game.app.player begin
	if self.state == fsm_player.sit then
		return true

	if position_meeting(x, y + 16, obj_wall0)
		return true
		
	if self.escada == 0 and position_meeting(x, y + 16, obj_wall2)
		return true
		
	if self.escada != 0 and position_meeting(x, y + 16, obj_wall4)
		return true
end

return false