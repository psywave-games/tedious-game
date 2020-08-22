/// @arg0 menuId
/// @arg1 xx0
/// @arg2 yy0
/// @arg3 xx1
/// @arg4 yy1
var var _axis = mouse_in_rectangle_axis(argument1, argument2, argument3, argument4)
if abs(_axis) begin
	game.app.input.internal_mouse_hover |= true
	game.app.input.internal_mouse_axis += _axis
	
	/// apenas troque o selecionado se o mouse estiver movendo
	if game.app.input.mouse begin
		game.app.interface.select = argument0
	end
end