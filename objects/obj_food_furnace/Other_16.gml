/// @description ev_lite_step

#region GAS EFFECT
if gas begin

	if state == fsm_mob.idle then
		gas_size += 0.005
		
	else if gas_size > 5.0 then
		gas_size = 5
		
	else if gas_size > 0.3 then
		gas_size -= 0.05

end

part_type_life(part_fire, room_speed * 0.1, room_speed * clamp(gas_size, 0.3, 4))
#endregion