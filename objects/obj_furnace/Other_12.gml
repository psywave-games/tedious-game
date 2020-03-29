/// @description ev_interact_up

switch self.select begin
	case 1:
		self.state = fsm_mob.idle
		self.gas = false
		break
		
	case 2:
		if not hurt begin
			score_add(-300)
			hurt = true
		end
		else 
			speak(game.app.player, t(msg.interact_furnace_rate))
		break
end