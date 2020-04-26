/// @description ev_interact_down

#region SLOT ITENS
var freezer_item_b = game.inventory.item_local_coffe == obj_food_freezer
var freezer_item_a = game.inventory.item_local_soap == obj_food_freezer

var player_item_a = game.inventory.item_local_soap == obj_player
var player_item_b = game.inventory.item_local_coffe == obj_player
#endregion

if not energy_drinks
	and not freezer_item_a
	and not freezer_item_b
	and not player_item_a
	and not player_item_b
	then
	speak(game.app.player, t(msg.interact_freezer_emputy))
	
else if select == 1 begin
	var _list = ""
	
	if energy_drinks then
		_list += string(energy_drinks) + "x " + t(msg.psy_energy) + "\n"
		
	if freezer_item_a then
		_list += "1x " + t(msg.psy_soap) + "\n"
		
	if freezer_item_b then
		_list += "1x " + t(msg.psy_coffe) + "\n"
		
	speak(game.app.player, _list)
end

else if select == 2 and freezer_item_a then
	game.inventory.item_local_soap = obj_player
	
else if select == 2 and player_item_a then
	game.inventory.item_local_soap = obj_food_freezer

else if select == 3 and freezer_item_b then
	game.inventory.item_local_coffe = obj_player

else if select == 3 and player_item_b then
	game.inventory.item_local_coffe = obj_food_freezer

else if select == 4 and energy_drinks begin
	if game.app.player.requirements[need.water] >= 40 begin
		score_add(game.app.player.requirements[need.water]/2)
	
		game.app.player.requirements[need.water] -= 40 
		game.app.player.in_mob = spr_item_monster
		game.app.player.state = fsm_player.drink
		game.app.player.image_index = 0
		energy_drinks -= 1
	end
	else 
		speak(game.app.player, t(msg.interact_water_full))

end
	
self.select = 1