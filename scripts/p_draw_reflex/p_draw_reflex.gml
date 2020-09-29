/// @description reflexion player
/// @arg0 x
/// @arg1 y
/// @arg2 width
/// @art3 height
/// @arg4 alpha

var _xx = argument0
var _yy = argument1
var _width = argument2
var _height = argument3
var _alpha = argument4

/// easter egg missngno (vulgo: matuto)
if secret(thematic_missigno) begin
	draw_sprite_ext(missingno, 0, _xx, _yy, 0.4, 0.4, 0, c_white, _alpha)
end
/// draw normal player reflex
else 
	p_draw(_xx, _yy, game.app.player.image_xscale * _width, game.app.player.image_yscale * _height, _alpha)