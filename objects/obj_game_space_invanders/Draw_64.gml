/// @description game script
var enemys_death = 0

#region DRAW SCREEN
draw_set_color(c_black)
draw_rectangle(0,0,480,240,false)

draw_set_color(c_white)
draw_rectangle(0,0,480,240,true)
#endregion

#region DRAW MESSAGE
if invaders_direction >= 4 begin
	var gameover = false
	
	for (var enemy = 0; enemy < 18; enemy++) begin
		if invaders_live[enemy] begin
			gameover = true
			break
		end
	end

	draw_set_text_config(fnt_game1, c_white, 1.0, fa_center, fa_middle)
	if gameover then
		draw_text(240, 120, t(msg.gameover_title))
	else 
		draw_text(240, 120, "w")
end
#endregion

#region DRAW ENEMYS
else begin
	draw_set_color(c_green)
	var enemy = 0
	var enemy_min_x = 0xFF
	var enemy_max_x = 0
	var enemy_max_y = 0
	for (var xx = 1; xx <= 6; xx++) begin
		for (var yy = 1; yy <= 3; yy++) begin
			/// coordinates
			var xx0 = invaders_x + (xx * 32) - 8
			var yy0 = invaders_y + (yy * 32) - 8
			var xx1	= invaders_x + (xx * 32) + 8
			var yy1 = invaders_y + (yy * 32) + 8
		
		
			/// kill invader
			if point_in_rectangle(fire_pos_x, fire_pos_y - 8, xx0, yy0, xx1, yy1) and invaders_live[enemy] begin
				invaders_live[enemy] = false /// died enemy
				fire_pos_y = -1 /// reset shoot
			end
	
			/// render enemy
			if invaders_live[enemy] begin
				draw_rectangle(xx0, yy0, xx1, yy1, false)
			
				/// first enemy
				if xx0 <= enemy_min_x then
					enemy_min_x = xx0 - 1
		
				/// lasy enemy
				if xx1 >= enemy_max_x then
					enemy_max_x = xx1 + 1
		
				/// last enemy
				if yy1 >= enemy_max_y then
					enemy_max_y = yy1 + 1
				
			end else 
				enemys_death += 1
			
			enemy += 1
		end
	end
end
#endregion

#region DRAW PLAYER
/// set player pos
player_pos = clamp(player_pos + game.app.input.key_axis_x * 8, 8, 472)

/// render player
draw_set_color(c_yellow)
draw_triangle(
	player_pos - 8,
	238,
	player_pos,
	222,
	player_pos + 8,
	238,
	false
)
#endregion

#region DRAW PLAYER FIRE
if fire_pos_y >= 0 begin
fire_pos_y -= 8
draw_set_color(c_yellow)
draw_rectangle(
	fire_pos_x,
	fire_pos_y - 8,
	fire_pos_x,
	fire_pos_y,
	false
)
end
#endregion

#region SHOOT PLAYER FIRE
if abs(game.app.input.key_axis_y) or game.app.input.key_interact begin
	if fire_pos_y < 0 begin
		fire_pos_x = player_pos
		fire_pos_y = 238
	end
end
#endregion

#region ENEMYS MOVE
/// matou todos os inimigos
if enemys_death >= 18 then
	invaders_direction = 4

/// ainda restam inimigos
switch invaders_direction begin
	/// esquerda para direita
	case 0:
		if enemy_max_x < 480 then
			invaders_x += round((6+enemys_death+nivel)/5)
		else 
			invaders_direction = 1
		break
		
	/// cima para baixo (pré esquerda -> direita)
	case 1:
		if enemy_max_y <= 216 begin
			invaders_direction = 2
			invaders_y += 8
		end else 
			invaders_direction = 4
		break

	/// direita para esquerda
	case 2:
		if enemy_min_x > 0 then
			invaders_x -= round((6+enemys_death+nivel)/5)	
		else
			invaders_direction = 3
		break
		
	/// cima para baixo (pré direita -> esquerda)
	case 3:
		if enemy_max_y <= 216 begin
			invaders_direction = 0
			invaders_y += 8
		end else 
			invaders_direction = 4
		break
	
	/// incrementar contagem	
	default:
		invaders_direction += 1
		break
	
end
#endregion

#region RESET GAME
if invaders_direction > (room_speed * 2) begin
	invaders_x = 0
	invaders_y = 0
	invaders_direction = 0
	invaders_live = array_create(18, true)
	
	/// change dificult
	if not gameover then
		nivel += 5
	else 
		nivel = 0
end
#endregion