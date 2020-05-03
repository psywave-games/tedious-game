mob_install(fsm_mob.idle)
item_install("poop", object_index, -100)
item_install("piss", object_index, -100)


add_depth = -2
image_blend = color_azul_a

/// parte da frente do vaso
front_sprite =  layer_sprite_create(layer_create(depth -3), x, y, spr_batch_chair2)