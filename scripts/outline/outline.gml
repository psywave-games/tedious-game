/// @arg0 sprite
/// @arg1 signs
/// 0: cima (1)
/// 2: baixo (4)
/// 3: esquerda (8)
/// 1: direita (2)

if not argument1 then
	return null_surface
	
if not game.app.render.mode_outline then
	return null_surface
	
var _width = sprite_get_width(argument0)
var _height = sprite_get_width(argument0)
var _middle = _height/2
var _center = _width/2
var _surface_role = surface_create(_width + 2, _height + 2)
var _surface_line = surface_create(_width + 2, _height + 2)
var _sprite = argument0
var _signs = argument1	


surface_set_target(_surface_role)
draw_clear(c_black)
draw_set_blend_mode(bm_subtract)

for (var i = 0; i < 4; i++) begin
	if _signs >> i & 1 then switch i begin
		case 0:
			draw_sprite_ext(_sprite, image_index, _center, _middle - 1, image_xscale, image_yscale, image_angle, c_white, 1.0)
			break 
			
		case 2:
			draw_sprite_ext(_sprite, image_index, _center, _middle + 1, image_xscale, image_yscale, image_angle, c_white, 1.0)
			break 
		
		case 3:
			draw_sprite_ext(_sprite, image_index, _center - 1, _middle, image_xscale, image_yscale, image_angle, c_white, 1.0)
			break 
		
		case 1:
			draw_sprite_ext(_sprite, image_index, _center + 1, _middle, image_xscale, image_yscale, image_angle, c_white, 1.0)
			break 
	end
end


surface_reset_target()
surface_set_target(_surface_line)
draw_clear(c_white)
draw_set_blend_mode(bm_normal)
draw_surface(_surface_role, 0, 0)
draw_set_blend_mode(bm_subtract)
with game.app.player p_draw(_center + self.x - other.x, _middle + self.y - other.y, self.image_xscale, self.image_yscale, 1.0)
draw_sprite_ext(_sprite, image_index, _center, _middle, image_xscale, image_yscale, image_angle, c_white, 1.0)
draw_set_blend_mode(bm_normal)
surface_free(_surface_role)
surface_reset_target()

return _surface_line