/// @description ev_interact_message

#region itens slots
var player_item_a = game.inventory.item_local_soap == obj_player
var player_item_b = game.inventory.item_local_coffe == obj_player
var player_item_c = game.inventory.item_local_ramen_pan == obj_player
var player_item_d = game.inventory.item_local_ramen_food == obj_player

var fire_item_a = game.inventory.item_local_soap == self.object_index
var fire_item_b = game.inventory.item_local_coffe == self.object_index
var fire_item_c = game.inventory.item_local_ramen_pan == self.object_index
var fire_item_d = game.inventory.item_local_ramen_food == self.object_index
var fire_item_any = fire_item_a or fire_item_b or fire_item_c
#endregion

#region PUT ITEM IN TO FURNACE
if player_item_a and not game.inventory.item_ready_soap then
	self.message = text_interact(t(msg.interact_pan_furnace_put))
	
else if player_item_b and not game.inventory.item_ready_coffe then 
	self.message = text_interact(t(msg.interact_coffe_furnace_put))

else if player_item_c and not game.inventory.item_ready_ramen_pan then
	self.message = text_interact(t(msg.interact_pan_furnace_put))

else if player_item_d  and not game.inventory.item_ready_ramen_food and game.inventory.item_ready_ramen_pan then
	self.message = text_interact(t(msg.interact_ramen_furnace_put))
	
#endregion

#region GAP ITEM IN THE FURNACE 
else if fire_item_a and game.inventory.item_ready_soap then
	self.message = text_interact(t(msg.interact_soap_furnace_gap))

else if fire_item_b and game.inventory.item_ready_coffe then
	self.message = text_interact(t(msg.interact_coffe_furnace_gap))

else if fire_item_d and game.inventory.item_ready_soap then
	self.message = text_interact(t(msg.interact_ramen_furnace_gap))

#endregion

#region TURN ON/OFF FURNACE 
else if self.state == fsm_mob.idle and not gas then
	self.message = text_interact(t(msg.interact_furnace_gas))

else if self.state == fsm_mob.idle and gas then
	self.message = text_interact(t(msg.interact_furnace_fire))

else
	self.message = text_interact(t(msg.interact_furnace_off))

#endregion