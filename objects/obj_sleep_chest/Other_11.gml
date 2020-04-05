/// @description ev_interact

switch self.select begin

	/// blibia
	case 1:
		/// começar a ler livro
		if not game.app.player.book_read then
			book_page = 1

		/// ler livro
		speak(game.app.player, t(msg.interact_bible + book_page))
		game.app.player.book_read = true
		
		/// livro terminado
		if ++book_page > 13 begin
			score_add(points)
			book_page = 1
			points = 0
		end
		
		/// adicionar pontos
		if points >= 0 then
			score_add(10)
		break
end