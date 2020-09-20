/// @arg0 x
/// @arg1 y
/// @arg2 xscale
/// @arg3 yscale
/// @arg4 sprite_index
/// @arg5 color
/// @arg6 alpha

var _xx = argument0
var _yy = argument1
var _xscale = argument2
var _yscale = argument3
var _sprite = argument4
var _color = argument5
var _alpha = argument6
var _sign = sign(_xscale)
var _angle = 0

#region PISTOL|TEA|MONSTER
if _sprite == spr_item_pistol1
	or _sprite == spr_item_monster
	or _sprite == spr_item_tea then switch round(game.app.player.image_index) begin

	case 8:
	case 0:
		_angle = _sprite == spr_item_pistol1? (_sign? 270: 90): 0
		_xx += 4 * _sign
		_yy += 2
		break
	
	case 7:
	case 1:
		_angle =  _sprite == spr_item_pistol1? (_sign? 270: 90): 0
		_xx += 7 * _sign
		_yy += 1
		break
		
	case 6:
	case 2:
		_angle =  _sprite == spr_item_pistol1? (_sign? 270: 90): 0
		_xx += 8 * _sign
		_yy += 0
		break

	case 5:
	case 3:
		_angle =  _sprite == spr_item_pistol1? (_sign? 280: 80): 0
		_xx += 8 * _sign
		_yy += -5
		break

	case 4:
		_angle =  _sprite == spr_item_pistol1? (_sign? 300: 60): 0
		_xx += 7 * _sign
		_yy += -6
		break
end
#endregion 
#region GUITAR
if _sprite == spr_guitar begin
	_xscale = abs(_xscale)
	_angle = 315
	_xx += 2
	_yy -= 1
end
#endregion

draw_sprite_ext(_sprite, 0, _xx, _yy, _xscale, _yscale, _angle, _color, _alpha)