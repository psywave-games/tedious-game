if game.app.player.escada == 0 then
	exit

with game.app.player begin
	if position_meeting(self.x, self.y + 15, other) begin 
		/// subindo escad correndo
		if game.app.player.hspeed > 2 then
			self.y += word.slop * 3
		
		/// subindo caminhando/parado
		else
			self.y += word.slop
			
		self.vspeed = 0
	end
end
