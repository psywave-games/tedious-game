/// @description ev_interact_up

with obj_baseLamp begin
	if self.channel == other.channel then
		self.state = fsm_mob.idle
end

sfx_play(x, y, sound_sfx_click)