///	@see change behavior
#region SLEEP AND SEEK
if self.seek_on_sleep and self.state_ia = fsm_ia_boss.sleep then
	direction = point_direction(self.x, self.y, game.app.player.x, game.app.player.y)

#endregion

#region WAKE UP AND ATTACK
if self.state_ia == fsm_ia_boss.sleep and not random(10) then
	self.state_ia = choose(fsm_ia_boss.attack0, fsm_ia_boss.attack1, fsm_ia_boss.attack0)

#endregion

#region WAKE UP AND ESPECIAL
//if self.state_ia == fsm_ia_boss.sleep and not random(100) then
//	self.state_ia = fsm_ia_boss.especial
	
#endregion



if keyboard_check_pressed( ord("I")) then
	self.state_ia = fsm_ia_boss.sleep 
	

if keyboard_check_pressed( ord("O")) then
	self.state_ia = fsm_ia_boss.attack0

if keyboard_check_pressed( ord("P")) then
	self.state_ia = fsm_ia_boss.attack1
	
	