/// @description ev_mygame_start

#region ev_mygame_start
with game.app.interface event_user(ev_mygame_start)
with game.app.render event_user(ev_mygame_start)
with game.app.audio event_user(ev_mygame_start)
with game.app.input event_user(ev_mygame_start)
#endregion

state_reset(game.app, fsm_game.play)
started = true