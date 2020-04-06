/// @arg0 x
/// @arg1 y
/// @arg2 sprite_index
/// @arg3 color

var _xx = argument0
var _yy = argument1
var _sprite = argument2
var _color = argument3
var _sign = sign(game.app.player.image_xscale)
var _pistol_angle = _sign? 90: 270
var _angle = _sprite == spr_item_pistol? _pistol_angle: 0

switch round(game.app.player.image_index) begin
	case 0:
		_xx += 2 * _sign
		_yy += 0
		break
	
	case 1:
		_xx += 4 * _sign
		_yy += -1
		break
		
	case 2:
		_xx += 5 * _sign
		_yy += -4
		break

	case 3:
		_xx += 6 * _sign
		_yy += -6
		break

	case 4:
		_xx += 5 * _sign
		_yy += -4
		break

	case 5:
		_xx += 4 * _sign
		_yy += -1
		break

	case 6:
		_xx += 2 * _sign
		_xx += 0
		break
end

draw_sprite_ext(_sprite, 0, _xx, _yy, game.app.player.image_xscale, game.app.player.image_yscale, _angle, _color, 1)