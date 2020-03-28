mob_install(fsm_mob.running)

if start_closed begin
	image_speed = -1
	state = fsm_mob.idle
end