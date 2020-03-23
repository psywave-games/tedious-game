if self.state == fsm_obj.none or self.state == fsm_obj.broken then
	exit
	
//var looking = p_looking() * 14

if position_meeting(x, y, obj_player) begin
	/// Interagir
	if game.app.input.key_interact and self.state == fsm_obj.idle then
		event_user(ev_interact_down)
	
	/// Desinteragir
	else if game.app.input.key_interact and self.state == fsm_obj.running then
		event_user(ev_interact_up)
	
	
	
	/// Mostrar menssagem
	event_user(ev_interact_message)
	self.can_interact = true
end

else
	self.can_interact = false
