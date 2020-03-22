
#region MOVIMENTACAO
switch self.state begin
	case fsm_player.died:
	case fsm_player.idle:
		image_speed = 0.1
		speed = 0
		break
		
	case fsm_player.jump:
		/// Pular
		if game.app.input.key_jump begin 
			self.y -= 2
			vspeed -= 5
		end
		
		/// Cair no chão
		else if place_meeting(x, y + 1, obj_baseWall) then
			self.state = fsm_player.idle
			
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

#region GRAVITY 
var ignore = self.escada != 0 and position_meeting(x,y+17, obj_wall2)

if position_meeting(x, y + 16, obj_baseWall) and not ignore then
	vspeed = 0	

else 
	vspeed += 0.4

#endregion
