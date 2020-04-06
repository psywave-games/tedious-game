#region IGNORE MOB
if self.state == fsm_mob.none
	or self.state == fsm_mob.broken
	or game.app.state != fsm_game.play 
	or speaking(game.app.player) begin
		self.can_interact = false
		exit
end
#endregion
	
var looking = game.app.player.axis_looking * -20

#region INTERACTS
if game.app.player.state == fsm_player.idle begin

	if place_meeting(x, y + looking, obj_player) begin
		/// Interagir
		if game.app.input.key_interact and self.state == fsm_mob.idle begin
			if ++self.switchs >= 2 and self.can_break begin
				event_user(ev_interact_broken)
				speak(game.app.player, t(msg.interact_broken))
				self.state = fsm_mob.broken
			end
			else
				event_user(ev_interact_down)
		end
	
		/// Desinteragir
		else if game.app.input.key_interact and self.state == fsm_mob.running then
			event_user(ev_interact_up)
		
		/// Trocar interação
		else if abs(game.app.input.key_axis_switch) then
			event_user(ev_interact_switch)
	
		/// Mostrar menssagem
		event_user(ev_interact_message)
		self.can_interact = true
		
		/// Update interface
		with game.app.interface begin
			self.message = other.message
			self.can_interact |= true
		end
	end else 
		self.can_interact = false
		
end else
	self.can_interact = false
#endregion

if not (game.app.step % room_speed) then
	self.switchs = 0
	
lite_step()