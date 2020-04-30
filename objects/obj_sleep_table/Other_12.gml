/// @description ev_interact_up

if select == 1 begin
	alarm[ev_interact_up] = room_speed * 2
	audio_play(x,y, snd_pc_down, false)
	state = fsm_mob.none
end
else 
	event_user(ev_interact_down)