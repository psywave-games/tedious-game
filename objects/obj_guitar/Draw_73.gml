/// @description draw_bar

with game.app.player begin
	
	/// não estais a tocar uma viola!
	if self.state != fsm_player.guitar_idle
		and self.state != fsm_player.guitar_walk then
			exit
	
	if not game.inventory.item_ready_guitar then
		draw_mob_bar(game.inventory, self.x, self.yhead - 4, 5, "guitar")
end