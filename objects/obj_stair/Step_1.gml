with game.app.player begin
	if position_meeting(self.x, self.y + 15, obj_zoneStair) begin
	
		if game.app.input.key_axis_y != 0 then
			self.in_stair = game.app.input.key_axis_y

		if self.in_stair < 0 and self.y <= 165 then
			self.in_stair = 0

		if self.in_stair > 0 and self.y >= 230.0 then
			self.in_stair = 0
		
		if self.in_stair == 0 and self.hspeed == 0 then with other
			event_user(ev_interact_message)
	
	end 
	
	else begin
		self.in_stair = 0
		other.can_interact = false
	end
end