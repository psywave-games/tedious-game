outline_begin()


for (var index = 1; index < argument_count; index += 2) begin
	var _sprite = argument[index - 1]
	var _color = color(argument[index])
	
	/// Reduzir buffer de imagens na versão lite
	if lite() begin
		var _sad = round(_sad * 10)/10
		_color = color(argument[index], _sad)
	end 
	
	draw_sprite_ext(_sprite, self.image_index, self.x, self.y, self.image_xscale, self.image_yscale, self.image_angle, _color, self.image_alpha)
end

outline_end()


draw_debug_colison()