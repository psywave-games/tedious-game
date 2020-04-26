/// @description ev_interact_switch
var	item_b = game.inventory.item_local_coffe == obj_food_freezer or game.inventory.item_local_coffe == obj_player
var item_a = game.inventory.item_local_soap == obj_food_freezer or game.inventory.item_local_soap == obj_player
var _sign = game.app.input.key_axis_switch

if not energy_drinks and not item_a and not item_b then
	select = 1
	
#region SELECT 1
else if select == 1 and item_a and _sign then
	select = 2
	
else if select == 1 and item_b and _sign then
	select = 3

else if select == 1 and energy_drinks and _sign then
	select = 4
#endregion

#region SELECT 2
else if select == 2 and not _sign then
	select = 1
	
else if select == 2 and item_b and _sign then
	select = 3

else if select == 2 and energy_drinks and _sign then
	select = 4
#endregion
	
#region SELECT 3
else if select == 3 and energy_drinks and _sign then
	select = 4

else if select == 3 and item_a and not _sign then 
	select = 2
	
else if select == 3 and not _sign then
	select = 1
	
#endregion

#region SELECT 4
else if select == 4 and item_b and not _sign then 
	select = 3
	
else if select == 4 and item_a and not _sign then 
	select = 2
	
else if select == 4 and not _sign then 
	select = 1
#endregion