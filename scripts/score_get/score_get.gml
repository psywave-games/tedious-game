if score <= game.app.interface.display_score then
	return score
	
var sum = 1
var distance = score - game.app.interface.display_score

if distance >= 5000 then
	sum = 1000
else if distance >= 500 then
	sum = 100
else if distance >= 50
	sum = 10
	
game.app.interface.display_score += sum
	
return score <= game.app.interface.display_score? score: game.app.interface.display_score