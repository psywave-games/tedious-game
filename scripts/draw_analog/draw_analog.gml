/// @arg0 x
/// @arg1 y
/// @arg2 color
/// @arg3 pressed

var _xx = argument0
var _yy = argument1
var _size = sqrt(display_get_gui_height() * display_get_gui_width())
var _distance = mouse_nearest_distance(_xx, _yy)/(_size/8)
var _in_button = _distance <= 1 and _distance >= 0.64
var _in_analog = _distance <= 1
var _axis_x = 0
var _axis_y = 0
var _sizeA = _size/32
var _sizeB = _size/9
var _sizeC = _size/8
var _sizeD = _sizeC - _sizeA

#region DETECT DIRECTION
/// update analog
if _in_analog begin
	_axis_x = clamp(mouse_nearest_reference_x(_xx)/_sizeC, -1, 1)
	_axis_y = clamp(mouse_nearest_reference_y(_yy)/_sizeC, -1, 1)
	
	game.app.input.internal_analog_axis_x = abs(_axis_x) <= 0.2? 0: clamp(_axis_x * 1.4, -1, 1)
	game.app.input.internal_analog_axis_y = abs(_axis_y) <= 0.2? 0: clamp(_axis_y * 2.0, -1, 1)
end
/// reset analog
else begin
	game.app.input.internal_analog_axis_x = 0
	game.app.input.internal_analog_axis_y = 0
end
#endregion
#region DRAW STATIC
/// border background
draw_set_alpha(1.0)
draw_set_color(make_color_rgb(129,183,117))
draw_circle(_xx, _yy, _sizeC, false)

/// background
draw_set_alpha(_in_button? 0.64: 1.0)
draw_set_color(make_color_rgb(91,106,120))
draw_circle(_xx, _yy, _sizeB, false)


/// outline
draw_set_alpha(1.0)
draw_set_color(c_black)
draw_circle(_xx, _yy, _sizeC, true)
#endregion
#region DRAW DYNAMIC
var _dir = point_direction(0, 0, _axis_x, _axis_y)
var _max_x = abs(lengthdir_x(_sizeD, _dir))
var _max_y = abs(lengthdir_y(_sizeD, _dir))
var _min_x = - _max_x
var _min_y = - _max_y
_xx += clamp(_axis_x * _sizeC, _min_x, _max_x)
_yy += clamp(_axis_y * _sizeC, _min_y, _max_y)

/// button
draw_set_color(make_color_rgb(62, 70, 80))
draw_set_alpha(1.0)
draw_circle(_xx, _yy, _sizeA, false)
draw_set_alpha(1.0)
draw_set_color(c_black)
draw_circle(_xx, _yy, _sizeA, true)
#endregion
#region DPAD
if not _in_analog begin
	game.app.input.internal_analog_init = 0
end
else if not game.app.input.internal_analog_init begin
	game.app.input.internal_analog_init = game.app.step
	game.app.input.internal_analog_dpad |= 1 * (_axis_y < -0.4) /// up
	game.app.input.internal_analog_dpad |= 4 * (_axis_y > 0.4) /// down
	game.app.input.internal_analog_dpad |= 8 * (_axis_x < -0.4) /// left
	game.app.input.internal_analog_dpad |= 2 * (_axis_x > 0.4) /// right
end
#endregion

return _in_button