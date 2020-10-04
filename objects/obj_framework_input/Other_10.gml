/// @description ev_init
var _s = game.app.state

screen = not (_s == fsm_game.waitFocus
	or _s == fsm_game.lang
	or _s == fsm_game.credits 
	or _s == fsm_game.loading 
	or _s == fsm_game.loaded
)