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


with game.app.player begin

	#region TORSO DRAW
	switch self.state begin
		case fsm_player.idle:
			draw_sprite_ext(spr_playerIdle1, image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			draw_sprite_ext(spr_playerIdle2, image_index, _xx, _yy, _xscale, _yscale, p_head_angle(), c_white, _alpha)
			break

		case fsm_player.jump:
		case fsm_player.walk:
			/// Correndo
			if abs(hspeed) > 2 begin
				draw_sprite_ext(spr_playerRun1, image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
				draw_sprite_ext(spr_playerRun2, image_index, _xx, _yy, _xscale, _yscale, p_head_angle(), c_white, _alpha)
			end
			/// Caminhando
			else begin
				draw_sprite_ext(spr_playerWalk1, image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
				draw_sprite_ext(spr_playerWalk2, image_index, _xx, _yy, _xscale, _yscale, p_head_angle(), c_white, _alpha)
			end
			break
		
	end
	#endregion

	#region LEGS DRAW
	switch self.state begin
		case fsm_player.idle:
			draw_sprite_ext(spr_playerIdle0, image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			break

		case fsm_player.jump:
			/// Subindo
			if vspeed > 0 begin
				draw_sprite_ext(spr_playerJump0, image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			end
			/// Descendo
			else begin
				draw_sprite_ext(spr_playerFall0, image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			end
			break
	
		case fsm_player.walk:
			/// Correndo
			if abs(hspeed) > 2 begin
				draw_sprite_ext(spr_playerRun0, image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			end
			/// Caminhando
			else begin
				draw_sprite_ext(spr_playerWalk0, image_index, _xx, _yy, _xscale, _yscale, 0, c_white, _alpha)
			end
			break
	end
	#endregion

end