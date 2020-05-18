if game.app.state != fsm_game.play then
	exit 
	
else if self.state == fsm_player.none then
	exit

else if self.state == fsm_player.died then
	exit

else if self.state == fsm_player.dying then
	exit
		
else if self.state == fsm_player.sit then
	exit

else if self.state == fsm_player.sleep then
	exit

else if self.state == fsm_player.drink then
	exit
	
else if self.state == fsm_player.piss then
	exit

else if self.state == fsm_player.shower then
	exit

else if game.inventory.item_local_guitar == obj_player and abs(self.axis_x) then
	self.state = fsm_player.guitar_walk
	
else if game.inventory.item_local_guitar == obj_player then
	self.state = fsm_player.guitar_idle

else if abs(self.axis_x) then
	self.state = fsm_player.walk

else 
	self.state = fsm_player.idle