/// @description ev_interact_down

if game.app.player.requirements[need.water] >= 25 begin
	game.app.player.requirements[need.water] -= 25 
	game.app.player.state = fsm_player.drink
	game.app.player.image_index = 0

	score_add(points)

	points = 0
end
else 
	speak(game.app.player, t(msg.interact_water_full))