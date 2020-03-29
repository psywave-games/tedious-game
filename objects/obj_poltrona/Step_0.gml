if game.app.player == fsm_player.sit then
	self.can_interact = true
	
if game.app.step % room_speed then
	exit
	
if game.app.player.state != fsm_player.sit then 
	exit

if not instance_exists(obj_tv) then
	exit
	
if obj_tv.state != fsm_mob.running then
	exit
	
if points <= 0 then 
	exit 
	
points -= 10
score_add(10)