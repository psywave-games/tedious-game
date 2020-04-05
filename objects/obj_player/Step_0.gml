#region DIE
if state == fsm_player.died then
	exit

else if state == fsm_player.dying and image_index > 4 then 
	self.state = fsm_player.died
	
else if state == fsm_player.dying then
	exit

else if game.app.happy <= 0 begin
	self.state = fsm_player.dying
	image_index = 0
end
#endregion

#region ESPECIAL
else if self.state == fsm_player.sit and not game.app.input.key_interact then
	exit

else if self.state == fsm_player.sleep and not game.app.input.key_interact then
	exit
#endregion

#region DRINK
else if state == fsm_player.drink and image_index > 6 then 
	self.state = fsm_player.idle

else  if state == fsm_player.drink then
	exit

#endregion

#region MOVE
else if abs(self.axis_x) then
	self.state = fsm_player.walk

else 
	self.state = fsm_player.idle
#endregion