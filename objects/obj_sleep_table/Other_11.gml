/// @description ev_interact_down
switch self.select begin
	
	/// Ligar computador
	case 1:
		alarm[ev_interact_down] = room_speed * 2
		audio_play_at(x,y, snd_pc_up, false)
		state = fsm_mob.none
		break


	/// livro
	case 2:
		if game.app.player.darkness > 0.4 begin
			speak(game.app.player, t(msg.interact_light_rate))
		break end
		
		var _readed = book_read(
			msg.interact_book0,
			msg.interact_book1,
			msg.interact_book2,
			msg.interact_book3,
			msg.interact_book4,
			msg.interact_book5,
			msg.interact_book6,
			msg.interact_book7,
			msg.interact_book8,
			msg.interact_book9,
			msg.interact_book10,
			msg.interact_book11,
			msg.interact_book12
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
		
	/// maquinas agricolas
	case 3:
		audio_play_at(x,y, snd_pc_tada, false)
		url_open_ext("https://www.google.com/search?tbm=isch&q=maquinas+agricolas+tunadas", "_blank")
		score_add(troll_points)
		troll_points = 0
		break
end