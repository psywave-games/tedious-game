with game.app.player begin

	if self.escada == 0 then
		return position_meeting(x, y + 16, obj_wall0) or position_meeting(x, y + 16, obj_wall2)
		
	else 
		return position_meeting(x, y + 16, obj_baseWall)
	
end