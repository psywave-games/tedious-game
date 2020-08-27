if surface_exists(surface_darkness) begin
	
	#region PLAYER DARKNESS
	if p_exists() then
		game.app.player.darkness = (surface_getpixel(surface_darkness, game.app.player.x, game.app.player.yhead)/0xFFFFFF)
	#endregion

	#region RENDER DARKNESS
	draw_set_blend_mode(bm_subtract)
	draw_surface(surface_darkness, x, y)
	surface_free(surface_darkness)
	draw_set_blend_mode(bm_normal)
	#endregion
end