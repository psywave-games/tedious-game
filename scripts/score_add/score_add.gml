var _score = argument0

#region SUM SCORE/HAPPY
	game.app.interface.happy_sign = sign(_score)
	game.app.happy += _score/10
	score += abs(_score)
#endregion