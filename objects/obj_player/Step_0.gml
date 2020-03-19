///////
///
///	@function Step
///	@author RodrigoDornelles <rodrigo@dornelles.me>
///
///	@version	1.1		(12/12/2019) #c6db2a4 gameplay test
///	@revison	1.1.1	(12/12/2019) #4776e3c added smooth camera
///	@revison	1.2		(12/12/2019) #7b5387a started using pattern design mediator
///
///////
///
/// @see				controle de SFM do jogador
///	@description		state change
///
///////
///
///	@return void		
///
///////



if abs(self.axis_x) or abs(self.axis_y) begin
	self.state = fsm_player.walk
end
else begin
	self.state = fsm_player.idle
end