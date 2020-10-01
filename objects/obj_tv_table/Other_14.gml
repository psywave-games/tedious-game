/// @description ev_interact_message
var _games = text_switch(1, last_game + 2)

if self.state == fsm_mob.idle then
	self.message = text_interact(t(msg.interact_on), t(msg.psy_tv))

else switch self.select begin
	case 1:
		self.message = text_interact(t(msg.interact_off), t(msg.psy_tv)) + _games
		break
		
	default:
		self.message = text_interact(
			t(msg.interact_videogame),
			t(msg.menu_videogame_game1 + self.select - 2) 
		)
		
		self.message += _games
		break
end