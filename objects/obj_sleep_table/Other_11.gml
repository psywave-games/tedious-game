/// @description ev_interact_down
switch self.select begin
	
	/// Ligar computador
	case 1:
		alarm[ev_interact_down] = room_speed * 2
		sfx_play(x,y, sfx_pc_up)
		state = fsm_mob.none
		break


	/// livro
	case 2:
		/// começar a ler livro
		if not game.app.player.book_read then
			book_page = 1

		/// ler livro
		speak(game.app.player, t(msg.interact_book + book_page), p_head_direction(bbox_bottom, bbox_top))
		game.app.player.book_read = true
		
		/// livro terminado
		if ++book_page > 13 begin
			score_add(book_points)
			book_points = 0
			book_page = 1
		end else score_add(book_points? 5: -5)
		break
		
	/// maquinas agricolas
	case 3:
		sfx_play(x,y, sfx_pc_tada)
		url_open_ext("https://www.google.com/search?tbm=isch&q=maquinas+agricolas+tunadas", "_blank")
		score_add(troll_points)
		troll_points = 0
		break
end