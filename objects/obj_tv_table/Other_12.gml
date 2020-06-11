/// @description ev_interact_up

switch self.select begin
	case 1:
		self.state = fsm_mob.idle
		audio_play_at(x, y, snd_tv_off, false)
		audio_stop(snd_tv_noise)
		break
		
	case 2:
		mob_enter(fsm_player.sit, obj_tv_chair)
		alarm_set(ev_interact_up, 2)
		break
end

