#region ZONE STAIR
/// @description game.app.player.in_stair
with game.app.player begin
	if position_meeting(self.x, self.y + 15, obj_zoneStair) begin
	
	if game.app.input.key_axis_y != 0 then
		game.app.player.in_stair = game.app.input.key_axis_y

	if game.app.player.in_stair < 0 and game.app.player.y <= 165 then
		game.app.player.in_stair = 0

	if game.app.player.in_stair > 0 and game.app.player.y >= 230.0 then
		game.app.player.in_stair = 0
	
	end 
	
	else 
		game.app.player.in_stair = 0
end
#endregion
