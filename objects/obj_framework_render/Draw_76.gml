#region BACKGROUND
if background != -1 then
	layer_background_blend(background, color(color_verde_d))
	
#endregion
#region DARKNESS
surface_darkness = surface_create(room_width, room_height)
if surface_exists(surface_darkness) begin
	surface_set_target(surface_darkness)
	draw_set_alpha(color_darkness)
	draw_set_color(c_white)
	draw_rectangle(0, 0, room_width, room_height, false)
	draw_set_alpha(1.0)
	surface_reset_target()
end
#endregion