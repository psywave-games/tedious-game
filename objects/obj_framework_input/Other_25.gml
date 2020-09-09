/// @description ev_init
var _state = game.app.state

if _state == fsm_game.play then
	self.screen = true
	
if _state != fsm_game.credits and game.app.render.resolution > 640 then
	self.screen = true
	
else self.screen = false