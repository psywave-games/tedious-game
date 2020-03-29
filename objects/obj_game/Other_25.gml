/// @description start game

state_reset( game.app, fsm_game.play )
room_goto(rm_level0)
game.app.started = true

event_user(ev_init)

with game.app.interface event_user(ev_game_start)
with game.app.render event_user(ev_game_start)
with game.app.audio event_user(ev_game_start)
with game.app.input event_user(ev_game_start)