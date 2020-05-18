/// @arg0 state
/// @arg1 mobid

var _state = argument0
var _mob = argument1

with game.app.player begin

	self.state = _state
	self.in_mob = _mob.id
	self.in_first = true
end