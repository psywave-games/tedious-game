#region SPEED MANIPULATION
switch self.state begin

	case fsm_player.drink:
		image_speed = 1
		break
		
	case fsm_player.dying:	
		speed = 0
		break
	
	case fsm_player.sit:
	case fsm_player.sleep:
		y = yprevious
	
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
		image_speed = hspeed/6 * sign(hspeed)
		break
end
#endregion

#region SPEED MANIPULATION
switch self.state begin

	case fsm_player.drink:
		if state == fsm_player.drink and image_index >= 9 then 
			self.state = fsm_player.idle
		break
		
	case fsm_player.dying:	
		if image_index >= 4 begin 
			self.state = fsm_player.died
			sfx_play(x, y, sfx_shoot)
		end
		break
	
	case fsm_player.sit:
	case fsm_player.sleep:
		if game.app.input.key_interact and image_index != -1 begin
			self.image_yscale = abs(self.image_yscale)
			self.state = fsm_player.idle
		end
		break
end
#endregion

#region LOOKING HORIZONTAL
if sign(hspeed) != 0 begin
	image_xscale = abs(image_xscale) * sign(hspeed)
end
#endregion

#region LOOKING VERTICAL
ylooking = yhead + (game.app.input.key_axis_y * abs(y - yhead) * 2)
#endregion

#region USING MOB
/// quando estiver usando mob
if self.state == fsm_player.sit
	or self.state == fsm_player.sleep begin
	
	/// menssagem do mob
	with self.in_mob begin
		event_user(ev_interact_message)
		game.app.interface.message = self.message
		game.app.interface.can_interact = true
	end
	
	/// utilizando mob
	if not (game.app.step % room_speed) then with self.in_mob
		event_user(ev_interact_using)

end
#endregion

#region DEPTH
depth = self.in_stair != 0? word.depth_stair: word.depth_player

#endregion

#region SLOP
do begin
	yfoot = y + abs(image_yscale * 16)
	yhead = y - abs(image_yscale * (abs(y - bbox_top) - 16))
	
	var _gravity = p_sloop()
	
	vspeed = 0
	y += _gravity
end until (_gravity == 0)
#endregion

#region DEATH
if not game.app.happy 
	and self.state != fsm_player.dying 
	and self.state != fsm_player.died begin 
	
	self.state = fsm_player.dying
	image_index = 0
end
#endregion