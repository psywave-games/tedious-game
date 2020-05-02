if game.app.player != -1 begin
	game.app.player.x = self.x
	game.app.player.y = self.y

	instance_destroy(self.id)
end

game.app.player = self.id

self.state = fsm_player.none

self.in_stair = 0
self.in_mob = 0

self.ylooking = y
self.yfoot = y
self.yhead = y
self.gravity = 1

self.book_read = 0
self.requirements = array_create(3, 50)

speak_install()

event_user(ev_mygame_start)