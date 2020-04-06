with instance_nearest(game.app.player.x, game.app.player.y, obj_door0) begin
	if self.image_index > 1 then
		return false

	if distance_to_object(game.app.player) >= 1 then
		return false
		
	if game.app.input.key_axis_x == sign(game.app.player.x - self.x) then
		return false

	return true
end