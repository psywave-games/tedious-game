/// @description ev_mygame_start
event_all(ev_mygame_start)

state_reset(game.app, fsm_game.play)
started = true

alarm_set(ev_mygame_start_end, 1)