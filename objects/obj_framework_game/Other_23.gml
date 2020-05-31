/// @description ev_mygame_end
event_all(ev_mygame_end)
state_reset(game.app, fsm_game.over)

/// reset mobs
with obj_baseStatic begin
	self.state = fsm_mob.none
	self.image_index = 0
	self.image_speed = 0
	self.speed = 0
end