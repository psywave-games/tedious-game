/// @description slop

if place_meeting(x,y, game.app.player) then with game.app.player begin 
	if self.escada != 0 begin
		/// subindo escad correndo
		if game.app.player.hspeed > 2 then
			self.y += word.slop * 2
		
		/// subindo caminhando/parado
		else
			self.y += word.slop
		
		
		self.vspeed = 0
	end
end

