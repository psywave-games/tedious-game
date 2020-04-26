/// @description ev_lite_step

if gas begin

	if state == fsm_mob.idle then
		gas_size += 0.005
		
	else if gas_size > 4.0 then
		gas_size = 4
		
	else if gas_size > 1.1 then
		gas_size -= 0.05

end

part_type_life(part_fire, room_speed, room_speed * clamp(gas_size, 1.1, 4))

