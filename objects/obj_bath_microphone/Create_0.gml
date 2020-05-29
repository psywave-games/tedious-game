mob_install(fsm_mob.idle)

part_system = part_system_create()
part_emitter = part_emitter_create(part_system)
part_water = part_type_create()


part_type_size(part_water, 0.012, 0.012, 0, 0)
part_type_shape(part_water, pt_shape_square)
part_type_gravity(part_water, 0.002, 270)
part_type_alpha1(part_water, 0.75)