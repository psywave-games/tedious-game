/// @description outline
var _can_interact = false

with obj_baseLamp if self.can_interact and self.channel == other.channel then
	_can_interact = true

if _can_interact then
	outline(outline_sprite, outline_signs)