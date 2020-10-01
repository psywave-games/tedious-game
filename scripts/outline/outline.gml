/// @arg0 sprite
/// @arg1 signs
/// 0: cima (1)
/// 2: baixo (4)
/// 3: esquerda (8)
/// 1: direita (2)

if not argument1 then
	exit
	
if not game.app.render.mode_outline then
	exit
	
/// @todo fix
if browser() then
	exit
	
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
surface_reset_target()


draw_set_blend_mode(bm_add)
var _sx = display_get_gui_width()/camera_get_view_width(view_camera[0])
var _sy = display_get_gui_height()/camera_get_view_height(view_camera[0])
var _xx = ((x - _center) - game.app.render.camx) * _sx
var _yy = ((y - _middle) - game.app.render.camy) * _sy
draw_surface_ext(_surface_line, _xx, _yy, _sx, _sy, 0, c_white, lerp(0.16, 0.64, anim_fadetent(game.app.step, 0, room_speed/2, room_speed/4)))
surface_free(_surface_line)
surface_free(_surface_role)
draw_set_blend_mode(bm_normal)