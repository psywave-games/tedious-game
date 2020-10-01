/// @description update
var _asteroids = 0
var _colision = false
#region SCREEN BACKGROUND DRAW
draw_set_color(c_black)
draw_rectangle(vgn_x(0), vgn_y(0), vgn_x(480), vgn_y(240), false)

draw_set_color(c_white)
draw_rectangle(vgn_x(0), vgn_y(0), vgn_x(480), vgn_y(240), true)
#endregion
#region PLAYER TELEPORT
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
#endregion
#region PLAYER ROTATE
/// giroscopio
player_direction += game.app.input.key_axis_x * 3

/// do a barrel roll 360
if player_direction > 360 then
	player_direction = 0

/// do a barrel roll 0
else if player_direction < 0 then
	player_direction = 360
#endregion
#region PLAYER TRUST
/// impulsionar motor
var engine = game.app.input.key_axis_y? 0.12: 0
player_hspeed = clamp(player_hspeed + lengthdir_x(engine, player_direction), -2, 2)
player_vspeed = clamp(player_vspeed - lengthdir_y(engine, player_direction), -2, 2)

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
if (abs(player_hspeed) + abs(player_vspeed)) < 0.12 begin 
	player_hspeed = 0
	player_vspeed = 0
end
#endregion
#region PLAYER SOUND
if game.app.input.key_axis_y < 0 and not audio_is_playing(snd_asteroids_extraShip) then
	audio_play(snd_asteroids_extraShip, false)
	
if game.app.input.key_axis_y > 0 and not audio_is_playing(snd_asteroids_trust) then
	audio_play(snd_asteroids_trust, true)
	
else if game.app.input.key_axis_y == 0 then
	audio_stop(snd_asteroids_trust)
#endregion
#region SHOOT SCRIPT
if not transition begin
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
		audio_play(snd_asteroids_fire, false)
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
end
#endregion
#region SHOOT DRAW
if not transition begin
	draw_set_color(c_yellow)
	for (var i = 0; i < array_length_1d(shoot_x); i++) begin
		if shoot_x[i] < 0 then
			continue
	
		if shoot_y[i] < 0 then
			continue
	
		draw_point(vgn_x(shoot_x[i]), vgn_y(shoot_y[i]))
	end
end
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
			draw_poly(
				art_asteroid_large,
				[11,11], 
				vgn_x(asteroid_x[i]),
				vgn_y(asteroid_y[i]),
				vgn_size(1),
				vgn_size(1),
				0,
				true
			)
			break
			
		case 9:
			draw_poly(
				art_asteroid_mid,
				[9,9], 
				vgn_x(asteroid_x[i]),
				vgn_y(asteroid_y[i]),
				vgn_size(1),
				vgn_size(1),
				0,
				true
			)break
			
		case 4:
			draw_poly(
				art_asteroid_small,
				[4,4], 
				vgn_x(asteroid_x[i]),
				vgn_y(asteroid_y[i]),
				vgn_size(1),
				vgn_size(1),
				0,
				true
			)break
			
		case 3:
			draw_poly(
				art_asteroid_mini,
				[3,3], 
				vgn_x(asteroid_x[i]),
				vgn_y(asteroid_y[i]),
				vgn_size(1),
				vgn_size(1),
				0,
				true
			)break
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

			/// asteroid pequeno pequeno
			if asteroid_size[j] <= 3 begin
				audio_play(snd_asteroids_bangSmall, false)
				myscore += score_vgn(25)
			end
			
			/// asteroid pequeno
			else if asteroid_size[j] <= 4 begin
				audio_play(snd_asteroids_bangMedium, false)
				myscore += score_vgn(10)
			end
			
			/// asteroid medio
			else if asteroid_size[j] <= 9 begin
				audio_play(snd_asteroids_bangLarge, false)
				myscore += score_vgn(5)
			end
			
			/// asteroid grande
			else begin 
				myscore += score_vgn(1)
				audio_play(snd_asteroids_bangLarge, false)
			end
			
			/// destroy shoot
			shoot_x[i] = -1
			shoot_y[i] = -1
			
			/// create minors asteroids
			for (var model = 0; model <= 4; model++) begin
				/// level 10... all asteroids
				if model >= 0 and asteroid_size[j] <= 3 and level >= 10 then break
				if model >= 1 and asteroid_size[j] <= 4 and level >= 10 then break
				if model >= 3 and asteroid_size[j] <= 9 and level >= 10 then break
				if model >= 2 and asteroid_size[j] <= 11 and level >= 10 then break
				/// level 7,8,9
				if model >= 0 and asteroid_size[j] <= 3 and level <= 9 then break
				if model >= 1 and asteroid_size[j] <= 4 and level <= 9 then break
				if model >= 3 and asteroid_size[j] <= 9 and level <= 9 then break
				if model >= 1 and asteroid_size[j] <= 11 and level <= 9 then break
				/// level 4,5,6
				if model >= 0 and asteroid_size[j] <= 3 and level <= 6 then break
				if model >= 1 and asteroid_size[j] <= 4 and level <= 6 then break
				if model >= 2 and asteroid_size[j] <= 9 and level <= 6 then break
				if model >= 1 and asteroid_size[j] <= 11 and level <= 6 then break
				/// level [1,2,3]
				if model >= 0 and asteroid_size[j] <= 3 and level <= 3 then break
				if model >= 0 and asteroid_size[j] <= 4 and level <= 3 then break
				if model >= 2 and asteroid_size[j] <= 9 and level <= 3 then break				
				if model >= 1 and asteroid_size[j] <= 11 and level <= 3 then break			

				
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
					
					asteroid_hspeed[n] = (asteroid_hspeed[j] + 0.5) * choose(-2, -1, 1, 2) * min(level/5, 1)
					asteroid_vspeed[n] = asteroid_vspeed[j] * random_range(-2, 2) * min(level/5, 1)
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
#region ASTEROID COUNT|COLISION
for (var i = 0; i < array_length_1d(asteroid_x); i++) begin
	/// destroyd
	if (asteroid_x[i] == -1) then
		continue
	
	/// count
	_asteroids += 1
	
	/// colision player
	if point_distance(asteroid_x[i], asteroid_y[i], player_x, player_y) <= asteroid_size[i] + 3 begin
		audio_play(snd_asteroids_bangLarge, false)
		asteroid_x[i] = -1
		_colision |= true
	end
end
#endregion
#region PLAYER DRAW
if not transition begin
	draw_set_color(c_yellow)
	draw_poly(
		art_veh_player, 
		[4,4], 
		vgn_x(player_x),
		vgn_y(player_y),
		vgn_size(1),
		vgn_size(1),
		player_direction,
		true
	)
end
#endregion
#region MESSAGE DRAW
if transition begin
	draw_set_text_config(fnt_game1, c_white, 1.0, fa_center, fa_middle)
	/// show gameover message
	if not life then
		draw_text(vgn_x(240), vgn_y(120), t(msg.gameover_title))
		
	/// show level
	else begin
		var _text = "Level: " + string(level) + "\nLifes: " + string(life)
		draw_text(vgn_x(240), vgn_y(120), _text)
	end
end
#endregion
#region LEVEL PASS
if _colision and not transition begin
	life -= 1
	transition += 1
end
#endregion
#region LEVEL OVER
if not _asteroids and not transition begin
	level += 1
	transition += 1
end
#endregion
#region TRANSITION
if transition then
	transition += 1
#endregion
#region RESET GAME
if transition > (room_speed * 2) then
	event_user(ev_mygame_restart)
#endregion