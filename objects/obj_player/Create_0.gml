game.app.player = self.id

self.state = fsm_player.none

#region USING
/// @see in_fist está variavel serve para verificar se é
/// a primeira vez que o jogador está interagindo,
/// e evitar o bug de entrar e sair de um mob
self.in_first = false			
self.in_stair = 0
self.in_mob = 0
#endregion

#region POS/MAP
self.ylooking = y
self.yfoot = y
self.yhead = y
self.gravity = 1
#endregion

#region PROGRESS
self.book_read = 0
self.requirements = array_create(3, 50)
#endregion

#region PARTICLES
part_system = part_system_create()

/// cascata de mijo
part_emitter_penis = part_emitter_create(part_system)
part_piss = part_type_create()
part_type_size(part_piss, 0.012, 0.012, 0, 0)
part_type_shape(part_piss, pt_shape_disk)
part_type_alpha3(part_piss, 1, 1, 0)
part_type_speed(part_piss, 0.02, 0.025, 0, 0)
part_type_direction(part_piss, 0, 0, 0, 0)
part_type_gravity(part_piss, 0.002, 270)

part_song_install()
#endregion

speak_install()

event_user(ev_mygame_start)