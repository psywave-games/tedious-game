scene = 0

if game.app.state == fsm_game.intro and room != rm_intro then
	room_goto(rm_intro)