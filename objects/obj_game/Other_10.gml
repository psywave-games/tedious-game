/// @description ev_init

if game.app.state == fsm_game.intro and room != rm_intro begin
	music_play(0, sound_music_menu)
	room_goto(rm_intro)
end