/// @description game.app.player.escada

if place_meeting(x,y,game.app.player) begin
	if game.app.player.escada == 0 then
		game.app.player.escada = game.app.input.key_axis_y

end
else 
	game.app.player.escada = 0
