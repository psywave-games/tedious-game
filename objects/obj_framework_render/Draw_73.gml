if surface_exists(surface_darkness) begin
	draw_set_blend_mode(bm_subtract)
	draw_surface(surface_darkness, x, y)
	surface_free(surface_darkness)
	draw_set_blend_mode(bm_normal)
end