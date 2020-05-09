/// @description ev_interact_switch

if state = fsm_mob.idle then
	select = 1
	
else 
	select = clamp(select + game.app.input.key_axis_switch, 1, 2)