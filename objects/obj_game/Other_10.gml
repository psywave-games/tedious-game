/// @description init
// You can write your code in this editor

with game.app.interface init

switch game.app.state begin 
	case fsm_game.cutscene:
	case fsm_game.play:
		timeline_running = true 
		break
		
	default: 
		timeline_running = false 
		break
end
