/// @description ev_mygame_start_pos

#region HALF-LIFE
if secret(thematic_halflife) begin
		game.app.render.color_invert = color_halflife
		with obj_door1 sprite_index = spr_door2
		with obj_paint sprite_index = spr_paint4
		with obj_paint image_blend = color_cinza_c
		timeline_index = tl_surprise_halflife_welcome
		timeline_running = true
		music_stop()
end
#endregion