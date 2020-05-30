/// notas musicais
part_song_sign = true
part_emitter_guitar = part_emitter_create(part_system)
part_song = part_type_create()
part_type_sprite(part_song, song, false, true, true)
part_type_blend(part_song, bm_add)
part_type_alpha3(part_song, 0.20, 1, 0.80)
part_type_speed(part_song, 0.05, 0.2, 0, 0)
part_type_life(part_song, room_speed, room_speed)

