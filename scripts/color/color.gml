/// @description aplica matriz/filtro cinza ou nagativo na cor
/// @arg0 c


#region get arguments 
    var color_r = color_get_red(argument[0])
    var color_g = color_get_green(argument[0])
    var color_b = color_get_blue(argument[0])
    var gray_scale = argument_count > 1? argument[1]: sad()
	var dark = gray_scale > 1? 0: 10
#endregion

#region apply gray
    var middle = clamp(((color_r + color_g + color_b)/3) - dark, 0, 255)

    color_r = clamp(color_r + ((middle - color_r) *  gray_scale), 0, 255)
    color_g = clamp(color_g + ((middle - color_g) *  gray_scale), 0, 255)
    color_b = clamp(color_b + ((middle - color_b) *  gray_scale), 0, 255)
#endregion

/// return hexadecimal color
return make_color_rgb(color_r, color_g, color_b)