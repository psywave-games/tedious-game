#region POS/SPEED MANIPULATION
switch self.state begin

	case fsm_player.drink:
		image_speed = 1
		break
		
	case fsm_player.dying:	
		speed = 0
		break
	
	case fsm_player.piss:
		image_speed = 0
		self.x = in_mob.x - (sign(image_xscale) * 6)
		self.y = in_mob.y
		break
	
	case fsm_player.sit:
	case fsm_player.sleep:	
		speed = 0
		image_speed = 0.1
		self.x = in_mob.x
		self.y = in_mob.y - abs(self.image_yscale * 2)
		self.image_yscale = abs(self.image_yscale) * sign(in_mob.image_yscale)
		self.image_xscale =	abs(self.image_xscale) * -sign(in_mob.image_xscale)
		break
		
	case fsm_player.guitar_idle:
	case fsm_player.idle:
		image_speed = 0.1
		speed = 0
		break
		
	case fsm_player.guitar_walk:
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

#region STATE MANIPULATION
switch self.state begin

	case fsm_player.drink:
		if state == fsm_player.drink and image_index >= 9 begin 
			if in_mob == spr_item_monster then
				speak(self, t(msg.interact_energy_bordao))
		
			self.state = fsm_player.idle
		end
		break
		
	case fsm_player.dying:	
		if image_index >= 4 begin 
			self.state = fsm_player.died
			audio_play(x, y, snd_shoot, false)
		end
		break
	
	case fsm_player.sit:
	case fsm_player.piss:
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
	
	/// calling mob events
	with self.in_mob begin
		event_user(ev_interact_message)
		event_user(ev_interact_using)
		game.app.interface.message = self.message
		game.app.interface.can_interact = true
	end

end
else if self.state == fsm_player.guitar_walk 
	or self.state == fsm_player.guitar_idle begin
	
	/// calling mob events
	with obj_guitar begin
		event_user(ev_interact_message)
		event_user(ev_interact_using)
		game.app.interface.message = self.message
		game.app.interface.can_interact = true
	end
end
#endregion

#region DEPTH
if self.state == fsm_player.sit then
	depth = self.in_mob.depth + self.in_mob.add_depth 

else if self.in_stair != 0 then
	depth = word.depth_stair

else
	depth = word.depth_player

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