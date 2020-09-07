/// @description gas size
if not game.app.step % 10 then
	exit

#region GAS EFFECT
if gas begin
	/// gas vazando ou consumindo
	if state == fsm_mob.idle then gas_size = min(gas_size + 0.006, 7)
	else gas_size = max(gas_size - 0.02, 0.3)
end

part_type_life(part_fire, room_speed * 0.1, lerp(room_speed * 0.1, room_speed * 1.5, gas_size))
#endregion