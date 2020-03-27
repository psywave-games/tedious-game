/// @description ev_interact

switch self.select begin
	/// maquinas agricolas
	case 1:
		url_open_ext("https://www.google.com/search?tbm=isch&q=maquinas+agricolas+tunadas", "_blank")
		break

	/// ler um livro
	case 2:
		if ++book_page > 13 or not game.app.player.book_read then
			book_page = 1

		speak(game.app.player, t(msg.interact_book + book_page))
		game.app.player.book_read = true
		break
end