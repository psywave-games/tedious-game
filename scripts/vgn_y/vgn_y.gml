/// @decription videogame scaller y
/// @arg0 y

var ratio = vgn_size(1)
var _vhm = ratio_get() >= 1? display_get_gui_height()/3: display_get_gui_height()/6

return (_vhm/ratio) + (argument0 * ratio)