/// @description ev_interact_broken

score_add(-100)
	
with obj_baseLamp begin
	if self.channel == other.channel then
		self.state = fsm_mob.broken
end

audio_play(x, y, snd_broki, false)