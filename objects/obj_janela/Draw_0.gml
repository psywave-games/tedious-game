if image_index > 6 and state == fsm_mob.running then
	image_index = 6
	
if image_index < 1 and state == fsm_mob.idle then
	image_index = 1
	

draw(
	spr_janela1, c_green
)