/// @arg0 x
/// @arg1 y
/// @arg2 text
/// @arg3 id

if mouse_hover(argument0, argument1, argument2) begin
	game.app.interface.select = argument3
	game.app.interface.hover |= true
end