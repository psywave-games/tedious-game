/// @description ev_interact_down

with game.app.player begin
	self.x = other.x
	self.y = other.y 
	self.image_xscale = other.image_xscale * -1
	
	self.state = fsm_player.sit
	game.app.input.key_interact = false
end