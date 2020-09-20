/// @description ev_init

switch game.app.state begin
	
	case fsm_game.play:
		unlock(trophy.firstplay)
		break

	
	case fsm_game.credits:
		rank(scoreboard.memorial, "RIP: " + text_date("/", msg.pt), unix_timestamp())
		unlock(trophy.memorial)
		break
end