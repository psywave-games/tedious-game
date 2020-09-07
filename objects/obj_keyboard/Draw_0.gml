draw(
	sprite_index, color_cinza_c
)

if self.state == fsm_mob.running begin
	var _color = color(color_cinza_b, sad(), irandom(16))
	part_song_stream(part_system, part_song, x,y)
	draw_sprite_ext(spr_keyboard1, image_index, x, y, image_xscale, image_yscale, image_angle, _color, image_alpha)
end
	
