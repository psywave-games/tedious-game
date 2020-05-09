
myscore = 0

player_x =    240
player_y =    120
player_hspeed = 0
player_vspeed = 0
player_direction = 270

shoot_hspeed = array_create(5, 0)
shoot_vspeed = array_create(5, 0)
shoot_x = array_create(5, -1)
shoot_y = array_create(5, -1)

asteroid_hspeed = array_create(64, 0)
asteroid_vspeed = array_create(64, 0)
asteroid_size = array_create(64, 11)
asteroid_x = array_create(64, -1)
asteroid_y = array_create(64, -1)

event_user(ev_mygame_restart)