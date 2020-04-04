if image_index > 8 and state == fsm_mob.running then
	image_index = 8
	
if image_index < 1 and state == fsm_mob.idle then
	image_index = 1
	
draw(
	sprite_index, color_cinza_a
)
