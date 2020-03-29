/// @description ev_mygame_start

state_reset(game.app, fsm_game.play)
room_goto(rm_level0)

started = true

#region ev_mygame_start
with game.app.interface event_user(ev_mygame_start)
with game.app.render event_user(ev_mygame_start)
with game.app.audio event_user(ev_mygame_start)
with game.app.input event_user(ev_mygame_start)
#endregion
