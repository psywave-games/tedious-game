with instance_nearest(game.app.player.x, game.app.player.y, obj_porta) begin
	if self.image_index > 1 then
		return false

	if distance_to_object(game.app.player) >= 1 then
		return false

	if game.app.input.key_axis_x != sign(self.x - game.app.player.x) then
		return false

	return true
end