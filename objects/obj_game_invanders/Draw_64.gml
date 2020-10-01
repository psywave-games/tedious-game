/// @description game script
var enemys_death = 0
var enemy = 0
var enemy_min_x = 0xFF
var enemy_min_y = 0xFF
var enemy_max_x = 0
var enemy_max_y = 0

#region SCREEN DRAW
draw_set_color(c_black)
draw_rectangle(vgn_x(0), vgn_y(0), vgn_x(480), vgn_y(240), false)

draw_set_color(c_white)
draw_rectangle(vgn_x(0), vgn_y(0), vgn_x(480), vgn_y(240), true)
#endregion

#region MESSAGE DRAW
if invaders_direction >= 4 begin
	var gameover = false
	
	for (var enemy = 0; enemy < 18; enemy++) begin
		if invaders_live[enemy] begin
			gameover = true
			break
		end
	end

	draw_set_text_config(fnt_game1, c_white, 1.0, fa_center, fa_middle)
	
	/// show gameover message
	if gameover then
		draw_text(vgn_x(240), vgn_y(120), t(msg.gameover_title))
		
	/// show level
	else begin
		var _text = "Level: " + string(round(myscore/90) + 1)
		draw_text(vgn_x(240), vgn_y(120), _text)
	end
		
end
#endregion

#region PLAYER [MOVE&DRAW]
/// set player pos
player_pos = clamp(player_pos + game.app.input.key_axis_x * 8, 8, 472)

/// render player
draw_set_color(c_yellow)
draw_poly(
	art_veh_player,
	[4,4], 
	vgn_x(player_pos),
	vgn_y(230),
	vgn_size(1.6), 
	vgn_size(1.6),
	270,
	true
)
#endregion

#region SHOOT [DRAW]
if fire_pos_y >=  0 begin
	draw_set_color(c_yellow)
	draw_line(
		vgn_x(fire_pos_x),
		vgn_y(fire_pos_y - 8),
		vgn_x(fire_pos_x),
		vgn_y(fire_pos_y),
	)
end
#endregion

#region ENEMYS [DESTROY&DRAW]
if invaders_direction < 4 begin
	draw_set_color(c_green)
	
	for (var xx = 1; xx <= 6; xx++) begin
		for (var yy = 1; yy <= 3; yy++) begin
			/// coordinates
			var xx0 = invaders_x + (xx * 32) - 8
			var yy0 = invaders_y + (yy * 32) - 8
			var xx1	= invaders_x + (xx * 32) + 8
			var yy1 = invaders_y + (yy * 32) + 8
		
		
			/// kill invader
			if point_in_rectangle(fire_pos_x, fire_pos_y - 8, xx0, yy0, xx1, yy1) and invaders_live[enemy] begin
				audio_play(snd_invaders_explosion, false)
				invaders_live[enemy] = false /// died enemy
				fire_pos_y = -1 /// reset shoot
				myscore += score_vgn(5)
			end
	
			/// render enemy
			if invaders_live[enemy] begin
				/// anim 0
				if current_second % 2 begin
					draw_poly(
						art_invader0, 
						[8,8],
						vgn_x(invaders_x + (xx * 32)), 
						vgn_y(invaders_y + (yy * 32)), 
						vgn_size(1), 
						vgn_size(1), 
						0, 
						true
					)
				end
				/// anim 1
				else begin
					draw_poly(
						art_invader1, 
						[8,8],
						vgn_x(invaders_x + (xx * 32)), 
						vgn_y(invaders_y + (yy * 32)), 
						vgn_size(1), 
						vgn_size(1), 
						0, 
						true
					)
				end
				
				/// get [min&max] [x&y]
				enemy_min_x = min(enemy_min_x, xx0)
				enemy_min_y = min(enemy_min_y, yy0)
				enemy_max_x = max(enemy_max_x, xx1)
				enemy_max_y = max(enemy_max_y, yy1)
				
			end else 
				enemys_death += 1
			
			enemy += 1
		end
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
			invaders_x += round((6+enemys_death+(myscore/18))/5)	
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
			invaders_x -= round((6+enemys_death+(myscore/18))/5)	
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

#region SHOOT MOVE
/// spawn shoot
if game.app.input.key_fire then if fire_pos_y < 0 begin
	audio_play(snd_invaders_fire, false)
	fire_pos_x = player_pos
	fire_pos_y = 238
end


/// shoot move
fire_pos_y -= 16

/// reset fire after pass enemy
if fire_pos_y < enemy_min_y + 8 then
	fire_pos_y = -1 
#endregion

#region RESET GAME
if invaders_direction > (room_speed * 2) begin
	/// yanderedev be like:
	var old_score = gameover? 0: myscore
	myscore = gameover? myscore: 0
	event_user(ev_mygame_restart)
	myscore = old_score
end
#endregion