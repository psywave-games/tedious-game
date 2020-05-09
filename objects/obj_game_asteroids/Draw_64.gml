/// @description update

/// @description Insert description here
// You can write your code in this editor

#region SCREEN BACKGROUND DRAW
draw_set_color(c_black)
draw_rectangle(0,0, 480, 240, false)

#endregion

#region SCREEN BORDER DRAW
draw_set_color(c_white)
draw_rectangle(0,0, 480, 240, true)

#endregion

#region PLAYER MOVIMENT
/// teleport
if game.app.input.key_axis_y < 0 begin
	do begin
		var success = true
		player_x = irandom(480)
		player_y = irandom(240)
		
		player_hspeed = 0
		player_vspeed = 0

		for (var i = 0; i < array_length_1d(asteroid_x); i++) begin
			/// destroyd
			if asteroid_x[i] == -1 then
				continue
		
			/// colide
			if point_distance(asteroid_x[i], asteroid_y[i], player_x, player_y) <= asteroid_size[i] * 3 then
				success = false
		end
	end until success
end

/// giroscopio
player_direction += game.app.input.key_axis_x * 3

/// do a barrel roll 360
if player_direction > 360 then
	player_direction = 0

/// do a barrel roll 0
else if player_direction < 0 then
	player_direction = 360

/// impulsionar motor
var engine = game.app.input.key_axis_y? 0.18: 0
player_hspeed = clamp(player_hspeed + lengthdir_x(engine, player_direction), -3, 3)
player_vspeed = clamp(player_vspeed - lengthdir_y(engine, player_direction), -3, 3)

/// incrementar velocidade
player_x += player_hspeed 
player_y += player_vspeed

/// atrevesou tela pela direita
if player_x < 0 then
	player_x = 480
	
/// atrevessou tela pela esquerda
else if player_x > 480 then
	player_x = 0
	
/// atrevesou tela por cima
if player_y < 0 then
	player_y = 240

/// atravessou tela por baixo
else if player_y > 240 then
	player_y = 0
	
/// parar nave do player
if (abs(player_hspeed) + abs(player_vspeed)) < 0.18 begin 
	player_hspeed = 0
	player_vspeed = 0
end
#endregion

#region SHOOT SCRIPT
/// shoot
if game.app.input.key_fire begin
	for(var i =  array_length_1d(shoot_x) - 1; i >= 1; i--) begin
		 shoot_x[i] = shoot_x[i - 1]
		 shoot_y[i] = shoot_y[i - 1]
		 
		 shoot_hspeed[i] = shoot_hspeed[i - 1]
		 shoot_vspeed[i] = shoot_vspeed[i - 1]
	end
	
	shoot_x[0] = player_x
	shoot_y[0] = player_y
	
	shoot_hspeed[0] = lengthdir_x(5, player_direction)
	shoot_vspeed[0] = -lengthdir_y(5, player_direction)
end

/// lazeeeeerr -------->
for (var i = 0; i < array_length_1d(shoot_x); i++) begin
	if (shoot_x[i] == -1) then
		continue

	shoot_x[i] += shoot_hspeed[i]
	shoot_y[i] += shoot_vspeed[i]
	
	/// fora da tela
	if shoot_x[i] > 480 then
		shoot_x[i] = -1
	
	/// fora da tela
	if shoot_y[i] > 240 then
		shoot_x[i] = -1
end

#endregion

#region SHOOT DRAW
draw_set_color(c_yellow)
for (var i = 0; i < array_length_1d(shoot_x); i++) begin
	if shoot_x[i] < 0 then
		continue
	
	draw_point(shoot_x[i], shoot_y[i])
end
#endregion

#region PLAYER DRAW
draw_set_color(c_yellow)
draw_poly(veh_player, [3,3], player_x, player_y, 1, 1, player_direction, true)
#endregion

#region ASTEROID MOVIMENT
for (var i = 0; i < array_length_1d(asteroid_x); i++) begin
	/// destroyd
	if (asteroid_x[i] == -1) then
		continue
	
	/// move
	asteroid_x[i] += asteroid_hspeed[i]
	asteroid_y[i] += asteroid_vspeed[i]
	
	/// atravesou pela esquerda
	if asteroid_x[i] < asteroid_size[i] then
		asteroid_x[i] = 480 - asteroid_size[i]
	
	/// atrevessou tela pela direita
	else if asteroid_x[i] > 480 - asteroid_size[i] then
		asteroid_x[i] = asteroid_size[i]
	
	/// atrevesou tela por cima
	if asteroid_y[i] < asteroid_size[i] then
		asteroid_y[i] = 240 - asteroid_size[i]

	/// atravessou tela por baixo
	else if asteroid_y[i] > 240 - asteroid_size[i] then
		asteroid_y[i] = asteroid_size[i]
end

#endregion

#region ASTEROID DRAW
draw_set_color(c_white)
for (var i = 0; i < array_length_1d(asteroid_x); i++) begin
	/// destroyd
	if (asteroid_x[i] == -1) then
		continue
	
	/// draw
	switch asteroid_size[i] begin
		case 11:
			draw_poly(asteroid_large, [11,11], asteroid_x[i], asteroid_y[i], 1, 1, 0, true)
			break
			
		case 9:
			draw_poly(asteroid_mid, [9,9], asteroid_x[i], asteroid_y[i], 1, 1, 0, true)
			break
			
		case 4:
			draw_poly(asteroid_small, [4,4], asteroid_x[i], asteroid_y[i], 1, 1, 0, true)
			break
			
		case 3:
			draw_poly(asteroid_mini, [3,3], asteroid_x[i], asteroid_y[i], 1, 1, 0, true)
			break
	end
end

#endregion

#region ASTEROID DESTROY 
for (var i = 0; i < array_length_1d(shoot_x); i++) begin
	// not shooted
	if shoot_x[i] < 0 then
		continue

	for (var j = 0; j < array_length_1d(asteroid_x); j++) begin
		/// destroyd
		if (asteroid_x[j] == -1) then
			continue
	
		/// jackpoint
		if point_distance(asteroid_x[j], asteroid_y[j], shoot_x[i], shoot_y[i]) <= asteroid_size[i] begin

			/// adicionar pontos
			if asteroid_size[j] <= 3 then
				myscore += 25
			else if asteroid_size[j] <= 4 then
				myscore += 10
			else if asteroid_size[j] <= 9 then
				myscore += 5
			else 
				myscore += 1
			
			/// destroy shoot
			shoot_x[i] = -1
			shoot_y[i] = -1
			
			/// create minors asteroids
			for (var model = 0; model < 3; model++) begin
				if model >= 0 and asteroid_size[j] <= 3 then break
				if model >= 1 and asteroid_size[j] <= 4 then break
				if model >= 2 and asteroid_size[j] <= 9 then break			
				for (var n = 0; n < array_length_1d(asteroid_x); n++) begin
					/// exists
					if (asteroid_x[n] != -1) then
						continue
					
					/// decrase size
					if asteroid_size[j] <= 4 then
						asteroid_size[n] = 3
					else if asteroid_size[j] <= 9 then
						asteroid_size[n] = 4
					else 
						asteroid_size[n] = 9
						
					asteroid_x[n] = asteroid_x[j]
					asteroid_y[n] = asteroid_y[j]
					
					asteroid_hspeed[n] = (asteroid_hspeed[j] + 0.5) * choose(-2, -1, 1, 2)
					asteroid_vspeed[n] = asteroid_vspeed[j] * random_range(-2, 2)
					break
				end
			end
			
			/// destroy original asteroid
			asteroid_x[j] = -1
			asteroid_y[j] = -1
		end
	end
end
#endregion
