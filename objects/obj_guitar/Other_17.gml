/// @description ev_interact_using

if game.app.input.key_interact and game.app.player.image_index != -1 begin
		game.inventory.item_local_guitar = self.object_index
exit end

/// guardar viola
if game.inventory.item_ready_guitar begin
	game.inventory.item_local_guitar = self.object_index
	self.state = fsm_mob.none
	score_add(2000)
exit end


/// score incrase
if not (game.app.step % room_speed) then
	score_add(2)

/// progress
game.inventory.item_ready_guitar += 1