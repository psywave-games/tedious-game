/// @description ev_init

if game.app.state == fsm_game.intro and room != rm_intro begin
	room_goto(rm_intro)
end
