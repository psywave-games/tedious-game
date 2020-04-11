#region MOVIMENT INPUTS
axis_x = game.app.input.key_axis_x * 2

if abs(self.in_stair) then
	axis_x -= game.app.input.key_axis_y

axis_x = sign(axis_x)
#endregion

#region COLISON HORIZOTAL
var next_x = self.x + (16 * axis_x)

repeat 2 begin
	if next_x < word.limit or next_x > (room_width - word.limit) or p_door() begin
		axis_x = 0
		hspeed = 0
	end
	
	next_x = self.x + self.hspeed
end
#endregion

#region REQUERIMENTS/DEATH
if not (game.app.step % room_speed) begin
	requirements[need.water] = clamp(requirements[need.water] + 1, 0, 100)
	requirements[need.food] = clamp(requirements[need.food] + 1, 0, 100)
end
#endregion

lite_step()