#region MOVIMENT INPUTS
axis_x = game.app.input.key_axis_x

if abs(self.in_stair) then
	axis_x -= game.app.input.key_axis_y

#endregion

#region COLISON HORIZOTAL
var next_x = self.x + (16 * axis_x)

repeat 2 begin
	if next_x < word.limit_left or next_x > word.limit_right or p_door() begin
		axis_x = 0
		hspeed = 0
	end
	
	next_x = self.x + self.hspeed
end
#endregion

#region REQUERIMENTS
if not (game.app.step % room_speed) begin
	requirements[need.water] = clamp(requirements[need.water] + 1, 0, 100)
	requirements[need.food] = clamp(requirements[need.food] + 1, 0, 100)
end
#endregion

lite_step()