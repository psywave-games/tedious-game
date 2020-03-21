/// @description corrimao

fundo = layer_create(100)
frente = layer_create(-220)

corrimao_fundo = layer_sprite_create(fundo, x, y, spr_escada1)
corrimao_frente = layer_sprite_create(frente, x, y, spr_escada1)

layer_sprite_xscale(corrimao_fundo, image_xscale)
layer_sprite_xscale(corrimao_frente, image_xscale)
layer_sprite_yscale(corrimao_fundo, image_yscale)
layer_sprite_yscale(corrimao_frente, image_yscale)

