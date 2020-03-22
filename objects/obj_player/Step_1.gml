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
#endregion


#region COLISON HORIZOTAL
var next_x = self.x + (16 * axis_x)

/// não sair do mapa horizontalmente
if next_x < word.limit_left or next_x > word.limit_right begin
	axis_x = 0
	hspeed = 0
end

#endregion





