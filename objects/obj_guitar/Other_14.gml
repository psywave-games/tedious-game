/// @description ev_interact_message

if game.inventory.item_local_guitar == self.object_index then
	self.message = text_interact(t(msg.interact_music_despacitos))
	
else
	self.message = text_interact(t(msg.interact_music_stop))