/// @arg0 state
/// @arg1 mobid

var _state = argument0
var _mob = argument1

with game.app.player begin

	self.state = _state
	self.in_mob = _mob.object_index

	self.x = _mob.x
	self.y = _mob.y 
	self.image_xscale = _mob.image_xscale * -1
end

game.app.input.key_interact = false