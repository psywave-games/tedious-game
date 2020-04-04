/// @description Menssage Interagir


if self.state == fsm_mob.running then
	self.message = t(msg.interact_off)

else switch self.select begin
	case 1:
		self.message = t(msg.interact_on) + " " + t(msg.psy_tv)
		break
		
	case 2:
		self.message = t(msg.interact_videogame)
		break

end


	