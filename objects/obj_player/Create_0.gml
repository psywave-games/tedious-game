if game.app.player != -1 begin
	game.app.player.x = self.x
	game.app.player.y = self.y

	instance_destroy(self.id)
end


game.app.player = self.id

self.state = fsm_player.none

self.escada = 0

self.book_read = 0

speak_install()

event_user(ev_mygame_start)