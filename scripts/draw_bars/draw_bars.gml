/// @arg0 menuId
/// @arg1 count 
/// @arg2 x
/// @arg3 y

var menu = argument[0]
var bars = argument[1]
var text = string_repeat("|", bars)


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
end



