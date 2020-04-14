/// @arg0 state
/// @arg1 mobid

var _state = argument0
var _mob = argument1

with game.app.player begin

	self.state = _state
	self.in_mob = _mob.id

	self.x = _mob.x
	self.y = _mob.y - 2.0 
	self.image_xscale = _mob.image_xscale * -1
	self.image_index = -1
end