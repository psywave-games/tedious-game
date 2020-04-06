#region ZONE STAIR
/// @description game.app.player.in_stair
with game.app.player begin
	if position_meeting(self.x, self.y + 15, obj_zoneStair) begin
	
	/// Começar a mover na in_stair
	if game.app.player.in_stair == 0 then
		game.app.player.in_stair = game.app.input.key_axis_y

	/// sair da in_stair para cima
	if game.app.player.in_stair < 0 and game.app.player.y <= 165 then
		game.app.player.in_stair = 0

	/// sair da in_stair para baixo
	if game.app.player.in_stair > 0 and game.app.player.y >= 220.0 then
		game.app.player.in_stair = 0
	
	end 
	
	else 
		game.app.player.in_stair = 0
end
#endregion
