/// @description ev_interact_up

if select == 1 begin
	alarm[ev_interact_up] = room_speed * 2
	sfx_play(x,y, sfx_pc_down)
	state = fsm_mob.none
end
else 
	event_user(ev_interact_down)