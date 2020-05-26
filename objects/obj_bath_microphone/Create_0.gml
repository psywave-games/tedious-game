mob_install(fsm_mob.idle)

part_system = part_system_create()
part_emitter = part_emitter_create(part_system)
part_water = part_type_create()

part_type_sprite(part_water, square, false, false, false)
part_type_gravity(part_water, 0.002, 270)
part_type_alpha1(part_water, 0.75)

