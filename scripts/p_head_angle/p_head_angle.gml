/// @description player looking angle
/// @arg0 xscale

var _look = 0

with game.app.player begin 

	#region LOOKING
	if game.app.state != fsm_game.play then
		_look = 0
	
	else if self.state == fsm_player.piss then
		_look = 7.5
	
	else if self.state == fsm_player.sleep and speaking(self) then
		_look = 14
	
	else if self.state == fsm_player.sleep then
		_look = 0
	
	else if self.state == fsm_player.dying and image_index < 3 then
		_look = 0
	
	else if self.state == fsm_player.dying then
		_look = 14
		
	else if game.app.input.key_moonwalk then
		_look = 14
	
	else if speaking(self) then
		_look = speak_ylooking * 14

	else if in_stair != 0 then 
		_look = 14 * sign(in_stair)

	else if game.app.input.key_axis_y != 0 then 
		_look = game.app.input.key_axis_y * 7.5
	#endregion
	
	#region DEPRESSION
	if sad() >= 0.4 begin
		_look += sad() * 7
	end
	#endregion

end

/// fixture angle
if argument0 then return 360 - clamp(_look, -14, 14)
else return clamp(_look, -14, 14) 
	
	
	