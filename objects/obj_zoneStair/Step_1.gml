/// @description game.app.player.escada
if place_meeting(x,y,game.app.player) begin

	/// Começar a mover na escada
	if game.app.player.escada == 0 then
		game.app.player.escada = game.app.input.key_axis_y


	
	/// sair da escada para cima
	if game.app.player.escada < 0 and game.app.player.y <= 170 then
		game.app.player.escada = 0

	/// sair da escada para baixo
	if game.app.player.escada > 0 and game.app.player.y >= 210.0 then
		game.app.player.escada = 0


end
else 
	game.app.player.escada = 0
