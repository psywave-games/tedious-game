/// @arg0 menuId
/// @arg1 text
/// @arg2 x
/// @arg3 y
/// @arg4 color

var menu = argument[0]
var text = "< " + argument[1] + " >"

switch argument_count begin
	case 2: 
		draw_menu(menu, text)
		break 
		
	case 3: 
		draw_menu(menu, text, argument[2])
		break
		
	case 4:
		draw_menu(menu, text, argument[2], argument[3])
		break
		
	case 5:
		draw_menu(menu, text, argument[2], argument[3], argument[4])
		break
end



