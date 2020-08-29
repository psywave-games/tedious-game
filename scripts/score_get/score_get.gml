if score <= game.app.interface.display_score begin
	game.app.interface.happy_sign = 0
	return score
end
	
var _sum = 1
var _distance = score - game.app.interface.display_score

if _distance >= 5000 then
	_sum = 1000
else if _distance >= 500 then
	_sum = 100
else if _distance >= 50
	_sum = 10
	
game.app.interface.display_score += _sum
	
return min(score, game.app.interface.display_score)