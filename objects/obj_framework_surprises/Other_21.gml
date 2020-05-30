/// @description ev_mygame_start_pos

switch self.select begin
	
	case thematic.halflife:
		obj_door1.sprite_index = spr_door2
		obj_paint.sprite_index = spr_paint4
		obj_paint.image_blend = color_cinza_c
		timeline_index = tl_surprise_halflife_welcome
		timeline_running = true
		music_stop()
		break


end


