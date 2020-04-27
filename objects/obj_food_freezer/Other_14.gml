/// @description ev_interact_message

#region SLOT ITENS
var freezer_item_b = game.inventory.item_local_coffe == obj_food_freezer
var freezer_item_a = game.inventory.item_local_soap == obj_food_freezer

var player_item_a = game.inventory.item_local_soap == obj_player
var player_item_b = game.inventory.item_local_coffe == obj_player
#endregion

#region _first/_last switch
var _first = energy_drinks? 1: 2
var _last = 1

if energy_drinks then
	_last = 4
	
else if freezer_item_b or player_item_b then
	_last = 3
	
else if freezer_item_a or player_item_a then
	_last = 2
#endregion

if not energy_drinks
	and not freezer_item_a
	and not freezer_item_b
	and not player_item_a
	and not player_item_b
	or select = 1
	then

	self.message = text_interact(t(msg.interact_freezer_list))
	
else if select == 2 and freezer_item_a then
	self.message = text_interact(t(msg.interact_soap_freezer_gap))

else if select == 2 and player_item_a then
	self.message = text_interact(t(msg.interact_soap_freezer_put))

else if select == 3 and freezer_item_b then
	self.message = text_interact(t(msg.interact_coffe_freezer_gap))
	
else if select == 3 and player_item_b then
	self.message = text_interact(t(msg.interact_coffe_freezer_put))
	
else if select == 4 and energy_drinks then
	self.message = text_interact(t(msg.interact_drink_energy))

else 
	self.message = "#Error_404_" + string(select) + "\n"
	
if _last > 1 then
	self.message = message + text_switch(_first, _last)