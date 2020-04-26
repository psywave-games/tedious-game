draw(
	spr_sleep_table0, color_marrom_b,
	spr_sleep_table1, color_branco	
)


if self.state == fsm_mob.running begin
	draw_set_blend_mode(c_blue)
	draw_set_color(c_white)
	draw_lensflare(x - 9, y - 6, 2, 0.08, 0.08, 0, 0, choose(0.6, 0.8, 0.6))
	draw_sprite_ext(spr_sleep_table2, current_second % 2, x, y, image_xscale, image_yscale, image_angle, color(color_azul_a), 1)
end