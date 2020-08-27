/// @description ev_interact_down

switch self.select begin

	/// blibia
	case 1:		
		if game.app.player.darkness > 0.4 begin
			speak(game.app.player, t(msg.interact_light_rate))
		break end
	
		var _readed = book_read(
			msg.interact_bible0,
			msg.interact_bible1,
			msg.interact_bible2,
			msg.interact_bible3,
			msg.interact_bible4,
			msg.interact_bible5,
			msg.interact_bible6,
			msg.interact_bible7,
			msg.interact_bible8,
			msg.interact_bible9,
			msg.interact_bible10,
			msg.interact_bible11,
			msg.interact_bible12
		)
		
		if _readed begin
			score_add(book_points)
			book_points = 0
		end
		if book_points begin 
			book_points -= 10
			score_add(10)
		end
		else score_add(-15)
		break
		
	case 2:
		self.state = state == fsm_mob.idle? fsm_mob.running: fsm_mob.idle
		audio_play_at(x, y, snd_click, false)
		break
end