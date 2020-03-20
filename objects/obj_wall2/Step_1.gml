/// @description Insert description here
// You can write your code in this editor


/// @description Insert description here
// You can write your code in this editor


if place_meeting(x,y, game.app.player) then with game.app.player begin 
	if game.app.player.escada <= 0 and self.y <= other.y begin
		self.y += word.slop
		self.vspeed = 0
	end
end

