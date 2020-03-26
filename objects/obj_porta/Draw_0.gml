if image_index > 8 and state == fsm_mob.running then
	image_index = 8
	
if image_index < 1 and state == fsm_mob.idle then
	image_index = 1
	
draw(
	spr_door0, c_maroon
)
