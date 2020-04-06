if game.app.player.in_stair != 0 then
	exit

with game.app.player begin
	if position_meeting(self.x, self.y + 15, other) begin 
		self.y += word.slop
		self.vspeed = 0
	end
end