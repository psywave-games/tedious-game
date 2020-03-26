var looking = 0

if game.app.input.key_moonwalk then
	looking = 1

else if game.app.player.escada != 0 then 
	looking = game.app.player.escada

else if p_book_read() then
	looking = 1

else if game.app.input.key_axis_y != 0 then 
	looking = game.app.input.key_axis_y 
		
return looking