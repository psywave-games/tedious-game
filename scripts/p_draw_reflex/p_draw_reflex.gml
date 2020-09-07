var _xx = argument0
var _yy = argument1
var _xscale = argument2
var _alpha = argument3


/// easter egg missngno (vulgo: matuto)
if game.app.clock_hour == 3 and game.app.clock_minute <= 3 begin
	draw_sprite_ext(missingno, 0, _xx, _yy, 0.4, 0.4, 0, c_white, _alpha)
end
/// draw normal player reflex
else 
	p_draw(_xx, _yy, _xscale, game.app.player.image_yscale, _alpha)