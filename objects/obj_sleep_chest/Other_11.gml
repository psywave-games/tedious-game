/// @description ev_interact_down

switch self.select begin

	/// blibia
	case 1:
		/// começar a ler livro
		if not game.app.player.book_read then
			book_page = 1

		/// ler livro
		speak(game.app.player, t(msg.interact_bible + book_page), p_head_direction(bbox_bottom, bbox_top))
		game.app.player.book_read = true
		
		/// livro terminado
		if ++book_page > 13 begin
			score_add(points)
			book_page = 1
			points = 0
		end
		else score_add(points? 5: -5)
		break
		
	case 2:
		self.state = state == fsm_mob.idle? fsm_mob.running: fsm_mob.idle
		audio_play_at(x, y, snd_click, false)
		break
end