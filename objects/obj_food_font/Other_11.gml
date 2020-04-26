/// @description ev_interact_down

if game.app.player.requirements[need.water] >= 25 begin
	score_add(game.app.player.requirements[need.water]/8)
	
	game.app.player.requirements[need.water] -= 25 
	game.app.player.in_mob = spr_item_tea
	game.app.player.state = fsm_player.drink
	game.app.player.image_index = 0
end
else 
	speak(game.app.player, t(msg.interact_water_full))