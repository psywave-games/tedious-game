/// @arg0 x
/// @arg1 y
/// @arg2 sprite_index
/// @arg3 color

var _xx = argument0
var _yy = argument1
var _sprite = argument2
var _color = argument3
var _sign = sign(game.app.player.image_xscale)
var _pistol_angle = _sign? 270: 90

switch round(game.app.player.image_index) begin
	case 8:
	case 0:
		_xx += 4 * _sign
		_yy += 2
		break
	
	case 7:
	case 1:
		_xx += 7 * _sign
		_yy += 1
		break
		
	case 6:
	case 2:
		_xx += 8 * _sign
		_yy += 0
		break

	case 5:
	case 3:
		_pistol_angle = _sign? 280: 80
		_xx += 8 * _sign
		_yy += -5
		break

	case 4:
		_pistol_angle = _sign? 300: 60
		_xx += 7 * _sign
		_yy += -6
		break
end

var _angle = _sprite == spr_item_pistol1? _pistol_angle: 0
draw_sprite_ext(_sprite, 0, _xx, _yy, game.app.player.image_xscale, game.app.player.image_yscale, _angle, _color, 1)