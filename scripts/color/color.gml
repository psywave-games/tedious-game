/// @description aplica matriz/filtro cinza ou nagativo na cor
/// @arg0 c


#region get arguments 
    var _color_r = color_get_red(argument[0])
    var _color_g = color_get_green(argument[0])
    var _color_b = color_get_blue(argument[0])
    var _gray_scale = argument_count > 1? argument[1]: sad()
	var _color_invert =  argument_count > 2? argument[2]: game.app.render.color_invert
#endregion
#region OPTIMIZE BROWSER GRAY SCALE
if browser() begin
	gray_scale = round(gray_scale*10)/10
end
#endregion
#region apply gray
    var _midde = clamp((_color_r + _color_g + _color_b)/3, 0, 255)

    _color_r = clamp(_color_r + ((_midde - _color_r) *  _gray_scale), 0, 255)
    _color_g = clamp(_color_g + ((_midde - _color_g) *  _gray_scale), 0, 255)
    _color_b = clamp(_color_b + ((_midde - _color_b) *  _gray_scale), 0, 255)
#endregion

/// return color
switch _color_invert begin
	case 1:
		return make_color_rgb(_color_r, _color_r, _color_g)

	case 2:
		return make_color_rgb(_color_r, _color_r, _color_b)

	case 3:
		return make_color_rgb(_color_r, _color_g, _color_r)

	case 4:
		return make_color_rgb(_color_r, _color_g, _color_g)

	case 5:
		return make_color_rgb(_color_r, _color_g, _color_b)

	case 6:
		return make_color_rgb(_color_r, _color_b, _color_r)

	case 7:
		return make_color_rgb(_color_r, _color_b, _color_g)

	case 8:
		return make_color_rgb(_color_r, _color_b, _color_b)

	case 9:
		return make_color_rgb(_color_g, _color_r, _color_r)

	case 10:
		return make_color_rgb(_color_g, _color_r, _color_g)

	case 11:
		return make_color_rgb(_color_g, _color_r, _color_b)

	case 12:
		return make_color_rgb(_color_g, _color_g, _color_r)

	case 13:
		return make_color_rgb(_color_g, _color_g, _color_b)

	case 14:
		return make_color_rgb(_color_g, _color_b, _color_r)

	case 15:
		return make_color_rgb(_color_g, _color_b, _color_g)

	case 16:
		return make_color_rgb(_color_g, _color_b, _color_b)

	case 17:
		return make_color_rgb(_color_b, _color_r, _color_r)

	case 18:
		return make_color_rgb(_color_b, _color_r, _color_g)

	case 19:
		return make_color_rgb(_color_b, _color_r, _color_b)

	case 20:
		return make_color_rgb(_color_b, _color_g, _color_r)

	case 21:
		return make_color_rgb(_color_b, _color_g, _color_g)

	case 22:
		return make_color_rgb(_color_b, _color_g, _color_b)

	case 23:
		return make_color_rgb(_color_b, _color_b, _color_r)

	case 24:
		return make_color_rgb(_color_b, _color_b, _color_g)

	default:
		return make_color_rgb(_color_r, _color_g, _color_b)
end