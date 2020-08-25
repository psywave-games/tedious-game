/// @description ev_interact_swich
self.select = clamp(select + game.app.input.key_axis_switch, 1, self.state != fsm_mob.running? 2: 3)

if self.state == fsm_mob.running then
	audio_play_at(x,y, snd_pc_switch, false)