var looking = 0

if game.app.player.escada != 0 then 
	looking = game.app.player.escada

else if game.app.input.key_axis_y != 0 then 
	looking = game.app.input.key_axis_y 
	
	
return looking