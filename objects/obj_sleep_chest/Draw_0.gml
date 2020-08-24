draw(
	spr_sleep_chest0, color_marrom_b,
	spr_sleep_chest1, color_vermelho,	
	spr_sleep_chest2, color_vermelho	
)


#region LIGHT
if self.state == fsm_mob.running begin
	draw_set_blend_mode(bm_add)
	draw_triangle_color(
	    x - 7,
	    y - 11.5,
	    x - 15.5,
	    y - 5,
	    x + 1.5,
	    y - 5,
		c_white,
		c_black,
		c_black,
	    false
	)
	draw_set_blend_mode(bm_normal)
end
#endregion

var _color = self.state = fsm_mob.running? color_vermelho: color_vermelho - 0x242424;
draw_sprite_ext(spr_sleep_chest3, image_index, x, y, image_xscale, image_yscale, image_angle, _color, image_alpha)