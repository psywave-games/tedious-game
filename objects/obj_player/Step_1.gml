///////
///
///	@function Begin Step
///	@author RodrigoDornelles <rodrigo@dornelles.me>
///
///	@version	1.1		(12/12/2019) #c6db2a4 gameplay test
///	@revison	1.1.1	(12/12/2019) #4776e3c added smooth camera
///	@revison	1.2		(12/12/2019) #7b5387a started using pattern design mediator
///
///////
///
/// @see				controles e colisões do jogador
///	@description		inputs/colisons
///
///////
///
///	@return void		
///
///////

#region INPUTS
axis_x = game.app.input.key_axis_x
axis_y = game.app.input.key_axis_y
#endregion


#region COLISON

next_x = self.x + (spd * axis_x) + (16 * axis_x)
next_y = self.y + (spd * axis_y) + (16 * axis_y)

/// não sair do mapa horizontalmente
if next_x < 0 or next_x > room_width then
	axis_x = 0

/// não sair do mapa verticalmente
if next_y < 0 or next_y > room_width then
	axis_y = 0

#endregion





