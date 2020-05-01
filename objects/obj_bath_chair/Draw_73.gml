item_ready_poop = (game.app.player.requirements[need.food] - 99) * room_speed

if game.app.player.state == fsm_player.sit 
	and game.app.player.in_mob == self.id
	and not self.item_ready_poop then
		draw_mob_bar(self, self.x, self.y - 32, 5, "poop")