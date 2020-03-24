/// @description start game

state_reset( game.app, fsm_game.play )
room_goto(rm_level0)
game.app.started = true


event_user(ev_init)
