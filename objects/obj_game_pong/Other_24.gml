/// @description ev_mygame_restart
#region SAVE SCORE RANK
if myscore begin
	var _score = "Score: " + text_number(myscore)
	rank(scoreboard.singlepong, _score, myscore)
end
#endregion

myscore = 0
player = 88

ball_x = 240
ball_y = 120
ball_hspeed = -3
ball_vspeed = choose(-2, -1, -0.5, 0.5, 1, 2)