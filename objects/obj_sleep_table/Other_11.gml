/// @description ev_interact_down

switch self.select begin
	
	/// Ligar computador
	case 1:
		state = fsm_mob.running
		break


	/// livro
	case 2:
		/// começar a ler livro
		if not game.app.player.book_read then
			book_page = 1

		/// ler livro
		speak(game.app.player, t(msg.interact_book + book_page))
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
		url_open_ext("https://www.google.com/search?tbm=isch&q=maquinas+agricolas+tunadas", "_blank")
		score_add(troll_points)
		troll_points = 0
		break
end