/// @description xscale

var _look = 0

with game.app.player begin 

	#region LOOKING
	if self.state == fsm_player.dying and image_index < 3 then
		_look = 0
	
	else if self.state == fsm_player.dying then
		_look = 14
		
	else if game.app.input.key_moonwalk then
		_look = 14
	
	else if speaking(self) then
		_look = speak_ylooking * 14

	else if in_stair != 0 then 
		_look = in_stair

	else if game.app.input.key_axis_y != 0 then 
		_look = game.app.input.key_axis_y * 14
	#endregion
	
	#region DEPRESSION
	if sad() >= 0.8 and _look < 0 then
		_look = 0

	else if sad() >= 0.4 then
		_look += sad() * 7
	#endregion

end

if argument0 then 
	return 360 - clamp(_look, -14, 14)
	
else
	return clamp(_look, -14, 14) 
	
	
	