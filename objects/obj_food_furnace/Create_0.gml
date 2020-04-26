mob_install(fsm_mob.idle)
hurt = false
gas = false
gas_size = 1.0

#region PARTICLE EMITTER
part_system = part_system_create()
part_system_depth(part_system, 350)

part_emitter_a = part_emitter_create(part_system)
part_emitter_b = part_emitter_create(part_system)
part_emitter_c = part_emitter_create(part_system)
#endregion

#region FIRE
part_fire = part_type_create()

part_type_sprite(part_fire, square, false, false, false)
part_type_alpha3(part_fire, 0, 1, 0)

part_type_gravity(part_fire, 0.001, 90)
#endregion