#region MOVIMENT INPUTS
axis_x = game.app.input.key_axis_x

if abs(self.in_stair) then
	axis_x -= game.app.input.key_axis_y * 2
	
if game.app.render.camwait then
	axis_x = 0

axis_x = sign(axis_x)
#endregion

#region COLISON HORIZOTAL
var next_x = self.x + (axis_x * abs(image_xscale * 8))
if next_x < word.limit or next_x > (room_width - word.limit) or p_door() begin
	axis_x = 0
	hspeed = 0
end
#endregion

#region REQUERIMENTS/DEATH
if not (game.app.step % (room_speed * 1.5)) begin
	var in_sleep = real(self.state != fsm_player.sleep)
	var in_water = 1
	var in_food = 1
	
	if self.state == fsm_player.sit and self.in_mob.object_index == obj_bath_chair then
		in_food = 5
		
	if self.state == fsm_player.piss and self.in_mob.object_index == obj_bath_chair then
		in_water = 5
	
	requirements[need.sleep] = clamp(real(requirements[need.sleep]) + in_sleep, 0, 100)
	requirements[need.water] = clamp(real(requirements[need.water]) + in_water, 0, 100)
	requirements[need.food] = clamp(real(requirements[need.food]) + in_food, 0, 100)
end
#endregion

lite_step()