/// @description aplica matriz/filtro cinza ou nagativo na cor
/// @arg0 c


#region get arguments 
    var color_r = color_get_red(argument[0])
    var color_g = color_get_green(argument[0])
    var color_b = color_get_blue(argument[0])
    var gray_scale = argument_count > 1? argument[1]: sad()
#endregion
#region OPTIMIZE BROWSER GRAY SCALE
if browser() begin
	gray_scale = round(gray_scale*10)/10
end
#endregion
#region apply gray
    var middle = clamp((color_r + color_g + color_b)/3, 0, 255)

    color_r = clamp(color_r + ((middle - color_r) *  gray_scale), 0, 255)
    color_g = clamp(color_g + ((middle - color_g) *  gray_scale), 0, 255)
    color_b = clamp(color_b + ((middle - color_b) *  gray_scale), 0, 255)
#endregion

/// return color
switch game.app.render.color_invert begin
	case 1:
		return make_color_rgb(color_r, color_r, color_g)

	case 2:
		return make_color_rgb(color_r, color_r, color_b)

	case 3:
		return make_color_rgb(color_r, color_g, color_r)

	case 4:
		return make_color_rgb(color_r, color_g, color_g)

	case 5:
		return make_color_rgb(color_r, color_g, color_b)

	case 6:
		return make_color_rgb(color_r, color_b, color_r)

	case 7:
		return make_color_rgb(color_r, color_b, color_g)

	case 8:
		return make_color_rgb(color_r, color_b, color_b)

	case 9:
		return make_color_rgb(color_g, color_r, color_r)

	case 10:
		return make_color_rgb(color_g, color_r, color_g)

	case 11:
		return make_color_rgb(color_g, color_r, color_b)

	case 12:
		return make_color_rgb(color_g, color_g, color_r)

	case 13:
		return make_color_rgb(color_g, color_g, color_b)

	case 14:
		return make_color_rgb(color_g, color_b, color_r)

	case 15:
		return make_color_rgb(color_g, color_b, color_g)

	case 16:
		return make_color_rgb(color_g, color_b, color_b)

	case 17:
		return make_color_rgb(color_b, color_r, color_r)

	case 18:
		return make_color_rgb(color_b, color_r, color_g)

	case 19:
		return make_color_rgb(color_b, color_r, color_b)

	case 20:
		return make_color_rgb(color_b, color_g, color_r)

	case 21:
		return make_color_rgb(color_b, color_g, color_g)

	case 22:
		return make_color_rgb(color_b, color_g, color_b)

	case 23:
		return make_color_rgb(color_b, color_b, color_r)

	case 24:
		return make_color_rgb(color_b, color_b, color_g)

	default:
		return make_color_rgb(color_r, color_g, color_b)
end