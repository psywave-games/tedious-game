/// @description ev_mygame_restart

#region SAVE SCORE RANK
if myscore begin
	var _score = "Score: " + text_number(myscore)
	rank(scoreboard.invanders, _score, myscore)
end
#endregion


myscore = 0
invaders_x = 0
invaders_y = 0
invaders_direction = 0
invaders_live = array_create(18, true)