/// @description sprite


#region BODY
switch self.state begin
	case fsm_player.idle:
		draw_sprite_ext(spr_playerRun0, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
		draw_sprite_ext(spr_playerRun1, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
		break

	case fsm_player.walk:
		/// Correndo
		if abs(hspeed) > 2 begin
			draw_sprite_ext(spr_playerRun0, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
			draw_sprite_ext(spr_playerRun1, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
			draw_sprite_ext(spr_playerRun2, image_index, x, y+2, image_xscale, image_yscale, p_head_angle(), c_white, 1.0)
		end
		/// Caminhando
		else begin
			draw_sprite_ext(spr_playerWalk0, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
			draw_sprite_ext(spr_playerWalk1, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
			draw_sprite_ext(spr_playerWalk2, image_index, x, y+2, image_xscale, image_yscale, p_head_angle(), c_white, 1.0)
		end
		
		break
		
end
#endregion
