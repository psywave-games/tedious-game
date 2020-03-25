if self.can_interact begin
	var outline = os_browser == browser_not_a_browser? 1: 2
	outline_start(outline, 0xFFFFFF)
end

for (var index = 1; index < argument_count; index += 2) begin
	var _sprite = argument[index - 1]
	var _color = argument[index]
	
	draw_sprite_ext(_sprite, self.image_index, self.x, self.y, self.image_xscale, self.image_yscale, self.image_angle, _color, self.image_alpha)
end

outline_end()