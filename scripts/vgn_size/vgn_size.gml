/// @description videogame scaler size

var _width = display_get_gui_width() - (padding *2)
var _height = display_get_gui_height() - (padding *2)


var ratio = (_width/480) * min((_height/_width) * 1.4, 1)

return ratio * argument0