mob_install(fsm_mob.idle)
hurt = false
gas = false
gas_size = 1.0

#region PARTICLE
part_fire = part_fire_install()
part_type_color2(part_fire, color_amarelo_b, color_vermelho)
part_emitter_a = part_emitter_create(part_system)
part_emitter_b = part_emitter_create(part_system)
part_emitter_c = part_emitter_create(part_system)
#endregion
