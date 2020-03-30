outline_begin()

draw_sprite_ext(spr_tv0, 0, x, y, image_xscale, image_yscale, 0, color(color_marrom_a, sad()), 1)

#region TELA

/// ligada
if self.state == fsm_mob.running begin
	draw_sprite_ext(spr_tv1, 0, x, y, image_xscale, image_yscale, 0, c_white, 1)
	draw_lensflare(x+7,y-6, 2, 0.3, 0.6, 0, 0, choose(0.6,0.8,0.6))
end 
/// desligado
else 
	draw_sprite_ext(spr_tv1, 0, x, y, image_xscale, image_yscale, 0, color_cinza_d, 1)

#endregion

draw_sprite_ext(spr_tv2, 0, x, y, image_xscale, image_yscale, 0, color(color_cinza_c, sad()), 1)


outline_end()