/// @description ev_mygame_restart

/// reiniciar variaveis do player
player_x =    240
player_y =    120
player_hspeed = 0
player_vspeed = 0
player_direction = 270

/// resetar as variaveis dos asteroids
asteroid_hspeed = array_create(64, 0)
asteroid_vspeed = array_create(64, 0)
asteroid_size = array_create(64, 11)
asteroid_x = array_create(64, -1)
asteroid_y = array_create(64, -1)

/// iniciar primeiros asteroids
for (var i = 0; i < 10; i++) begin 
    do begin
        var success = true
        asteroid_x[i] = irandom(480)
        asteroid_y[i] = irandom(240)
        asteroid_vspeed[i] = choose(-2.5, -2, -1, 1, 2, 2.5)
        asteroid_hspeed[i] = choose(-0.5, 0, 0, 0, 0.5)

        for (var j = 0; j < 10; j++) begin
            if i == j then
                continue

            if asteroid_x[i] > 120 and asteroid_x[i] < 360 then
                success = false

            if point_distance(asteroid_x[i], asteroid_y[i], asteroid_x[j], asteroid_y[j]) <= 11 then
                success = false
        end
    end    until success
end