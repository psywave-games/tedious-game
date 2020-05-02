/// @description ev_interact_up

switch self.select begin 

	/// abaixar tampo do vazo
	case 1:
		state = fsm_mob.idle
		break

	/// cagando
	case 2:
		if game.app.player.requirements[need.food] > 70 then
			speak(game.app.player, t(msg.interact_unmotivated))
			
		else 
			mob_enter(fsm_player.sit, self.id)
			
		break
		
	/// mijando
	case 3:
		if game.app.player.requirements[need.water] > 70 then
			speak(game.app.player, t(msg.interact_unmotivated))
			
		else 
			mob_enter(fsm_player.piss, self.id)
			
		break
	
end