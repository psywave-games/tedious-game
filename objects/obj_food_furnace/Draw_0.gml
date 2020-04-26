draw(
	sprite_index, color_cinza_b
)

#region FIRE
if state == fsm_mob.running begin
	
	part_type_color3(part_fire, c_white, 
		color(color_amarelo_b, sad()),
		color(color_vermelho ,sad())
	)
	
	part_emitter_region(part_system, part_emitter_a, x - 8, x - 4, y -6, y -4, ps_shape_diamond, ps_distr_linear)	
	part_emitter_region(part_system, part_emitter_b, x - 2, x + 2, y -6, y -4, ps_shape_diamond, ps_distr_linear)
	part_emitter_region(part_system, part_emitter_c, x + 4, x + 8, y -6, y -4, ps_shape_diamond, ps_distr_linear)

	
	part_emitter_burst(part_system, part_emitter_a, part_fire, 4)
	part_emitter_burst(part_system, part_emitter_b, part_fire, 4)
	part_emitter_burst(part_system, part_emitter_c, part_fire, 4)
end
#endregion

