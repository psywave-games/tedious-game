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

#region MISC
self.darkness = 0
self.requirements = array_create(3, 50)
#endregion

#region PARTICLES
part_system = part_system_create()
part_emitter_penis = part_emitter_create(part_system)
part_piss = part_piss_install()
part_song = part_song_install()
#endregion

speak_install()

event_user(ev_mygame_start)