with game.app.player begin
	if self.state == fsm_player.sit then
		return 0
		
	if self.state == fsm_player.sleep then
		return 0
		
	if room_height <= yfoot then
		return -1
		
	if self.in_stair == 0 and position_meeting(x, yfoot - 1 , obj_wall2)
		return -1
		
	if self.in_stair != 0 and position_meeting(x, yfoot - 1, obj_wall4)
		return -1
		
	if position_meeting(x, yfoot - 1, obj_wall0)
		return -1	

	if position_meeting(x, yfoot, obj_wall0)
		return 0
		
	if self.in_stair == 0 and position_meeting(x, yfoot , obj_wall2)
		return 0
		
	if self.in_stair != 0 and position_meeting(x, yfoot, obj_wall4)
		return 0
end

return 1