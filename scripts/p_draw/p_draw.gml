/// @description draw sprite player
/// @arg0 x
/// @arg1 y
/// @arg2 xscale
/// @arg3 yscale
/// @arg4 alpha

var _xx = argument0
var _yy = argument1
var _xscale = argument2
var _yscale = argument3
var _alpha = argument4
var _image_index = round(game.app.player.image_index)


with game.app.player begin

	#region ATTACH PRE-DRAW
	switch self.state begin
		case fsm_player.dying:
			p_draw_attach(_xx, _yy, _xscale, _yscale, spr_item_pistol1, 0xBABACA, _alpha)
			break
	end
	#endregion

	#region TORSO DRAW
	switch self.state begin
	
		case fsm_player.dying:
		case fsm_player.drink:
			draw_sprite_ext(spr_playerUse1, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break
			
		case fsm_player.sleep:
			draw_sprite_ext(spr_playerIdle1, 0, _xx, _yy, _xscale, _yscale, 90, c_white, _alpha)
			break
	
		case fsm_player.sit:
		case fsm_player.piss:
		case fsm_player.idle:
		case fsm_player.guitar_idle:
			draw_sprite_ext(spr_playerIdle1, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break

		case fsm_player.guitar_walk:
		case fsm_player.walk:
			/// Correndo
			if abs(hspeed) > 2 begin
				draw_sprite_ext(spr_playerRun1, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			end
			/// Caminhando
			else begin
				draw_sprite_ext(spr_playerWalk1, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			end
			break
		
	end
	#endregion

	#region LEGS DRAW
	switch self.state begin
		
		case fsm_player.sit:
			/// sentado no vazo
			if self.in_mob.object_index == obj_bath_chair then
				draw_sprite_ext(spr_playerPoop0, 0, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			/// sentado em cadeiras normais	
			else
				draw_sprite_ext(spr_playerSit0, 0, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break
		
		case fsm_player.sleep:
			draw_sprite_ext(spr_playerIdle0, 0, _xx, _yy, _xscale, _yscale, 90, c_white, _alpha)
			break
		
		case fsm_player.drink:
		case fsm_player.dying:
			draw_sprite_ext(spr_playerIdle0, 0, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break
			
		case fsm_player.piss:
			draw_sprite_ext(spr_playerPiss0, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break
			
		case fsm_player.guitar_idle:
		case fsm_player.idle:
			draw_sprite_ext(spr_playerIdle0, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break
	
		case fsm_player.guitar_walk:
		case fsm_player.walk:
			/// Correndo
			if abs(hspeed) > 2 begin
				draw_sprite_ext(spr_playerRun0, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			end
			/// Caminhando
			else begin
				draw_sprite_ext(spr_playerWalk0, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			end
			break
	end
	#endregion

	#region ATTACH POST-DRAW
	switch self.state begin
		case fsm_player.drink:
			if self.in_mob == spr_item_tea then
				p_draw_attach(_xx, _yy, _xscale, _yscale, spr_item_tea, color(color_amarelo_a), _alpha)
			
			if self.in_mob == spr_item_monster then
				p_draw_attach(_xx, _yy, _xscale, _yscale, spr_item_monster, color(color_verde_c), _alpha)
			break
			
		case fsm_player.guitar_walk:
		case fsm_player.guitar_idle:
			p_draw_attach(_xx, _yy, _xscale, _yscale, spr_guitar, color(color_cinza_b, sad(), irandom(16)), _alpha)
			break
	end
	#endregion
	
	#region HEAD POST-DRAW
	switch self.state begin
		case fsm_player.drink:
			draw_sprite_ext(spr_playerIdle2, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break
			
		case fsm_player.sleep:
			draw_sprite_ext(spr_playerIdle2, 0, _xx, _yy, _xscale, _yscale, p_head_angle(_xscale) + 90, c_white, _alpha)
			break
			
		case fsm_player.dying:	
		case fsm_player.walk:
		case fsm_player.guitar_walk:
			draw_sprite_ext(spr_playerIdle2, 0, _xx, _yy, _xscale, _yscale, p_head_angle(_xscale), c_white, _alpha)
			break

	
		case fsm_player.sit:
		case fsm_player.piss:
		case fsm_player.idle:
		case fsm_player.guitar_idle:
			draw_sprite_ext(spr_playerIdle2, _image_index, _xx, _yy, _xscale, _yscale, p_head_angle(_xscale), c_white, _alpha)
			break
	end
	#endregion

end