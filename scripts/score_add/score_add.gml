var _score = round(argument0)

#region SUM SCORE/HAPPY
	game.app.interface.happy_sign = sign(_score)

	score += abs(_score)
	
	if _score > 0 then
		game.app.happy += _score/5
	
	else 
		game.app.happy += _score/10
#endregion