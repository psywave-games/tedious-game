/// @description start game

state_reset( game.app, fsm_game.cutscene )
room_goto(rm_level0)
game.app.started = true


timeline_index = tm_cutscene0
timeline_loop = false

init