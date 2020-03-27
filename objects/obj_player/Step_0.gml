if game.app.happy <= 0 then
	self.state = fsm_player.died
	
else if game.app.input.key_jump or game.app.player.state == fsm_player.jump then
	self.state = fsm_player.jump

else if abs(self.axis_x) then
	self.state = fsm_player.walk

else
	self.state = fsm_player.idle
