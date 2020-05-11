#region DRAW TV
outline_begin()

draw_sprite_ext(spr_tv_table0, 0, x, y, image_xscale, image_yscale, 0, color(color_marrom_a), 1)


/// ligada
if self.state == fsm_mob.running begin
	draw_sprite_ext(spr_tv_table1, 1, x, y, image_xscale, image_yscale, 0, c_white, 1)
	draw_lensflare(x+7,y-4, 2, 0.3, 0.9, 0, 0, choose(0.6,0.8,0.6))
end 
/// desligado
else 
	draw_sprite_ext(spr_tv_table1, 0, x, y, image_xscale, image_yscale, 0, color_cinza_d, 1)

draw_sprite_ext(spr_tv_table2, 0, x, y, image_xscale, image_yscale, 0, color(color_cinza_c), 1)
outline_end()
#endregion

draw_debug_colison()