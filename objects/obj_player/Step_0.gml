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

else if game.app.input.key_jump or state == fsm_player.jump then
	self.state = fsm_player.jump

else if abs(self.axis_x) then
	self.state = fsm_player.walk

else 
	self.state = fsm_player.idle
