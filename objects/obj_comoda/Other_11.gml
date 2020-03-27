/// @description ev_interact

switch self.select begin

	/// ler um livro
	case 1:
		if ++book_page > 13 or not game.app.player.book_read then
			book_page = 1

		speak(game.app.player, t(msg.interact_bible + book_page))
		game.app.player.book_read = true
		break
end