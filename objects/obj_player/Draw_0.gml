#region TORSO DRAW
switch self.state begin
	case fsm_player.idle:
		draw_sprite_ext(spr_playerIdle1, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
		draw_sprite_ext(spr_playerIdle2, image_index, x, y, image_xscale, image_yscale, p_head_angle(), c_white, 1.0)
		break

	case fsm_player.jump:
	case fsm_player.walk:
		/// Correndo
		if abs(hspeed) > 2 begin
			draw_sprite_ext(spr_playerRun1, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
			draw_sprite_ext(spr_playerRun2, image_index, x, y, image_xscale, image_yscale, p_head_angle(), c_white, 1.0)
		end
		/// Caminhando
		else begin
			draw_sprite_ext(spr_playerWalk1, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
			draw_sprite_ext(spr_playerWalk2, image_index, x, y, image_xscale, image_yscale, p_head_angle(), c_white, 1.0)
		end
		break
		
end
#endregion

#region LEGS DRAW
switch self.state begin
	case fsm_player.idle:
		draw_sprite_ext(spr_playerIdle0, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
		break

	case fsm_player.jump:
		/// Subindo
		if vspeed > 0 begin
			draw_sprite_ext(spr_playerJump0, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
		end
		/// Descendo
		else begin
			draw_sprite_ext(spr_playerFall0, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
		end
		break
	
	case fsm_player.walk:
		/// Correndo
		if abs(hspeed) > 2 begin
			draw_sprite_ext(spr_playerRun0, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
		end
		/// Caminhando
		else begin
			draw_sprite_ext(spr_playerWalk0, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1.0)
		end
		break
end
#endregion
