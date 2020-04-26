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
var _image_index = round(image_index)


with game.app.player begin

	#region ATTACH PRE-DRAW
	switch self.state begin
	
		case fsm_player.dying:
			p_draw_attach(x, y, spr_item_pistol1, 0xBABACA)
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
		case fsm_player.idle:
			draw_sprite_ext(spr_playerIdle1, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break

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
			draw_sprite_ext(spr_playerSit0, 0, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break
		
		case fsm_player.sleep:
			draw_sprite_ext(spr_playerIdle0, 0, _xx, _yy, _xscale, _yscale, 90, c_white, _alpha)
			break
		
		case fsm_player.drink:
		case fsm_player.dying:
			draw_sprite_ext(spr_playerIdle0, 0, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break
			
		case fsm_player.idle:
			draw_sprite_ext(spr_playerIdle0, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break
	
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
			p_draw_attach(x, y, spr_item_tea, color(color_amarelo_a))
			break
	
	end
	#endregion
	
	#region HEAD POST-DRAW
	switch self.state begin
		case fsm_player.drink:
			draw_sprite_ext(spr_playerIdle2, _image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break
			
		case fsm_player.sleep:
			draw_sprite_ext(spr_playerIdle2, 0, _xx, _yy, _xscale, _yscale, 90, c_white, _alpha)
			break
			
		case fsm_player.dying:
			draw_sprite_ext(spr_playerIdle2, 0, _xx, _yy, _xscale, _yscale, p_head_angle(_xscale), c_white, _alpha)
			break

	
		case fsm_player.sit:
		case fsm_player.idle:
			draw_sprite_ext(spr_playerIdle2, _image_index, _xx, _yy, _xscale, _yscale, p_head_angle(_xscale), c_white, _alpha)
			break

		case fsm_player.walk:
			draw_sprite_ext(spr_playerWalk2, _image_index, _xx, _yy, _xscale, _yscale, p_head_angle(_xscale), c_white, _alpha)
			break
	end
	#endregion

end