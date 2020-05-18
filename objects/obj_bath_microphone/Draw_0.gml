draw(
	sprite_index, color_azul_a
)


/// Jogador Mijando
if self.state == fsm_mob.running and not (game.app.step % (room_speed/8)) begin
	var xx = x + (image_xscale * 5)
	var yy = y + 3
	
	part_type_color1(part_water, color(color_azul_a))
	part_emitter_region(part_system, part_emitter, xx - 3, xx + 3, yy, yy, ps_shape_rectangle, ps_distr_linear)		
	part_emitter_burst(part_system, part_emitter, part_water, 4)
end