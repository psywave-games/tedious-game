/// @description ev_interact_broken

score_add(-100)
global.lights_broken += 1

with obj_baseLamp begin
	if self.channel == other.channel then
		self.state = fsm_mob.broken
end

audio_play_at(x, y, snd_broki, false)

if global.lights_broken >= 4 then
	unlock(trophy.lightbroki)