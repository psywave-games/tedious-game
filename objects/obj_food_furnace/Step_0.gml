#region ITENS SLOTS
var fire_item_a = game.inventory.item_local_soap == self.object_index
var fire_item_b = game.inventory.item_local_coffe == self.object_index
var fire_item_c = game.inventory.item_local_ramen_pan == self.object_index
var fire_item_d = game.inventory.item_local_ramen_food == self.object_index
#endregion

#region COOK
if self.state == fsm_mob.running begin 
	if fire_item_a then
		game.inventory.item_ready_soap += gas_size
	
	if fire_item_b and not game.inventory.item_ready_coffe then
		game.inventory.item_ready_coffe += gas_size
	
	if fire_item_c and not game.inventory.item_ready_ramen_pan then
		game.inventory.item_ready_ramen_pan += gas_size
	
	if fire_item_d then
		game.inventory.item_ready_ramen_food += gas_size
end
#endregion