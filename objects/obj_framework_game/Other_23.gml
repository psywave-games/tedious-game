/// @description ev_mygame_end
event_all(ev_mygame_end)
state_reset(game.app, fsm_game.over)

with obj_baseStatic begin
	self.state = fsm_mob.none
end