/// @description ev_interact_up

switch self.select begin

	/// delisgar chuveiro
	case 1:
		self.state = fsm_mob.idle
		break
	

	/// tomar banho
	case 2:
		mob_enter(fsm_player.shower, self.id)
		break
end