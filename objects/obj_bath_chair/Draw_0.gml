if state == fsm_mob.running then
	draw(spr_batch_chair1, image_blend)
	
else 
	draw(spr_batch_chair0, image_blend)
	
layer_sprite_blend(front_sprite, color(image_blend))