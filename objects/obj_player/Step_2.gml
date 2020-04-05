
#region MOVIMENTACAO
switch self.state begin

	case fsm_player.drink:
		image_speed = 1
		break
		
	case fsm_player.sit:
	case fsm_player.dying:
	case fsm_player.died:
	case fsm_player.idle:
		image_speed = 0.1
		speed = 0
		break
		
	case fsm_player.walk:
		/// se for movimentar para o lado contrario parar
		if sign(hspeed) != sign(self.axis_x) then
			hspeed = 0
			
		/// aumentar velocidade	
		if abs(hspeed) <= p_max_speed() then
			hspeed += sign(self.axis_x) * p_speed()
			
		/// diminuir velocidade
		else
			hspeed -= sign(self.axis_x) * p_speed()

		/// velocidade da animação
		image_speed = hspeed/5 * sign(hspeed)
		 
		break
		
end
#endregion

#region LOOKING HORIZONTAL
if sign(hspeed) != 0 then
	image_xscale = sign (hspeed)

#endregion

#region LOOKING VERTICAL
if game.app.input.key_moonwalk then
	axis_looking = 1

else if p_book_read() then
	axis_looking = 1

else if speaking(self) then
	axis_looking = -1

else if in_stair != 0 then 
	axis_looking = in_stair

else if game.app.input.key_axis_y != 0 then 
	axis_looking = game.app.input.key_axis_y 

else 
	axis_looking = 0
#endregion

#region USING MOB
/// a cada um segundo que estiver sentado
if self.state == fsm_player.sit and not (game.app.step % room_speed) begin
	switch self.in_mob begin
	
		case obj_tv_chair:
			if obj_tv_table.state == fsm_mob.running then
				mob_score_add(self.in_mob.id, "points", 20)
				
			break
			
		case obj_sleep_chair:
			if obj_sleep_table.state == fsm_mob.running then
				mob_score_add(self.in_mob.id, "points", 20)
				
			break
	end
end
#endregion

#region DEPTH
depth = self.in_stair != 0? word.depth_stair: word.depth_player

#endregion

#region GRAVITY 

if p_foot() then
	vspeed = 0	

else 
	vspeed += 0.4

#endregion
