/// @description ev_interact_down

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
	game.inventory.item_local_soap = obj_food_furnace
	
else if player_item_b and not game.inventory.item_ready_coffe then 
	game.inventory.item_local_coffe = obj_food_furnace

else if player_item_c and not game.inventory.item_ready_ramen_pan then
	game.inventory.item_local_ramen_pan = obj_food_furnace

else if player_item_d  and not game.inventory.item_ready_ramen_food and game.inventory.item_ready_ramen_pan then
	game.inventory.item_local_ramen_food = obj_food_furnace
	
#endregion

#region GAP ITEM IN THE FURNACE 
else if fire_item_a and game.inventory.item_ready_soap begin
	game.inventory.item_local_soap = obj_player
	if not fire_item_b and not fire_item_c then
		self.state = fsm_mob.idle
end
	
else if fire_item_b and game.inventory.item_ready_coffe  begin 
	game.inventory.item_local_coffe = obj_player
	if not fire_item_a and not fire_item_c then
		self.state = fsm_mob.idle
end

else if fire_item_d and game.inventory.item_ready_soap begin
	game.inventory.item_local_ramen_food = obj_player
	game.inventory.item_local_ramen_pan = obj_player
	
	if not fire_item_a and not fire_item_b then
		self.state = fsm_mob.idle
end

#endregion

#region TURN ON FURNACE 
else if self.state == fsm_mob.idle and not gas then
	self.gas = true

else if self.state == fsm_mob.idle and gas then
	self.state = fsm_mob.running
#endregion

#region TURN OFF
else begin
	self.state = fsm_mob.idle
	self.gas = false
end
#endregion

/*

/// Colocar café no fogão
if game.inventory.item_local_coffe == obj_player then
	game.inventory.item_local_coffe = obj_food_furnace

else switch self.select begin
	case 1:
		self.state = fsm_mob.idle
		self.gas = false
		break
		
	case 2:
		/// Desligar fogão se não tiver ocupado
		if not fire_a and not fire_c begin
			self.select = 1 
			event_user(ev_interact_up)
		end
		
		/// Tirar café do fogão
		game.inventory.item_local_coffe = obj_player
		break
		
	case 3:
		if not hurt begin
			score_add(-300)
			hurt = true
		end
		else 
			speak(game.app.player, t(msg.interact_furnace_rate))
		break
end
if item then
	event_user(ev_interact_up)
	*/

