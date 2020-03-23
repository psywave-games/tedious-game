#region ZONE STAIR
/// @description game.app.player.escada
with game.app.player begin
	if position_meeting(self.x, self.y + 15, obj_zoneStair) begin
	
	/// Começar a mover na escada
	if game.app.player.escada == 0 then
		game.app.player.escada = game.app.input.key_axis_y

	/// sair da escada para cima
	if game.app.player.escada < 0 and game.app.player.y <= 170 then
		game.app.player.escada = 0

	/// sair da escada para baixo
	if game.app.player.escada > 0 and game.app.player.y >= 220.0 then
		game.app.player.escada = 0
	
	end 
	
	else 
		game.app.player.escada = 0

end
#endregion
