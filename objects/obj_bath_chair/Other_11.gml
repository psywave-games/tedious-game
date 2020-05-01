/// @description ev_interact_down

switch self.select begin 

	/// poop
	case 1:
		if game.app.player.requirements[need.food] > 70 then
			speak(game.app.player, t(msg.interact_unmotivated))
			
		else 
			mob_enter(fsm_player.sit, self.id)
			
		break

	
	/// peeeee
	

end

