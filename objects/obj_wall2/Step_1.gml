/// @description Insert description here
// You can write your code in this editor


/// @description Insert description here
// You can write your code in this editor


if place_meeting(x,y, game.app.player) then with game.app.player begin 
	
	if self.y <= other.y and not keyboard_check(vk_down) begin
		self.vspeed = 0
		self.y -= 5
	end
end

