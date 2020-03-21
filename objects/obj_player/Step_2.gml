
#region MOVIMENTACAO
switch self.state begin
	case fsm_player.died:
	case fsm_player.idle:
		image_speed = 0
		speed = 0
		break
		
	case fsm_player.walk:
		/// se for movimentar para o lado contrario parar
		if sign(hspeed) != sign(self.axis_x) then
			hspeed = 0
			
		/// aumentar velocidade	
		if abs(hspeed) <= p_max_speed() then
			hspeed += sign(self.axis_x) * 0.1
			
		/// diminuir velocidade
		else
			hspeed -= sign(self.axis_x) * 0.1
		

		/// velocidade da animação
		image_speed = hspeed/5
		 
		break
		
end
#endregion

#region ANIMACAO
if sign(hspeed) != 0 then
	image_xscale = sign (hspeed)

#endregion