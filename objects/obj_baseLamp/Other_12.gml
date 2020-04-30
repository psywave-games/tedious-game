/// @description ev_interact_up

with obj_baseLamp begin
	if self.channel == other.channel then
		self.state = fsm_mob.idle
end

audio_play(x, y, snd_click, false)