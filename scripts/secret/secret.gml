switch argument0 begin
	
	case thematic_duckquack: 
		return (game.app.social.fun >> argument0 & 1) or not irandom(50)

	case thematic_missigno:
		return (game.app.social.fun >> argument0 & 1) 
			or (game.app.clock_hour == 3 and game.app.clock_minute <= 3)
			or (current_hour == 3 and current_minute <= 3)

	default: return game.app.social.fun >> argument0 & 1
end