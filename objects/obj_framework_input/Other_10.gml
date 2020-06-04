/// @description Insert description here
// You can write your code in this editor

var _s = game.app.state

screen = not (_s == fsm_game.waitFocus
	or _s == fsm_game.lang
	or _s == fsm_game.credits 
	or _s == fsm_game.load
)