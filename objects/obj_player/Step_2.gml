///////
///
///	@function Create
///	@author RodrigoDornelles <rodrigo@dornelles.me>
///
///	@version	1.1		(12/12/2019) #c6db2a4 gameplay test
///	@revison	1.1.1	(12/12/2019) #4776e3c added smooth camera
///	@revison	1.2		(12/12/2019) #7b5387a started using pattern design mediator
///
///////
///
/// @see				movimentação e animação do jogador
///	@description		moviment/animation
///
///////
///
///	@return void		
///
///////

#region MOVIMENTACAO
switch self.state begin
	case fsm_player.died:
	case fsm_player.idle:
		speed = 0
		break
		
	case fsm_player.walk:
		hspeed = spd * sign(self.axis_x)
		break
		
end
#endregion


#region ANIMACAO
switch self.state begin
	case fsm_player.walk:
		if self.axis_x != 0 then
			image_xscale = sign (self.axis_x)
		break
end

#endregion