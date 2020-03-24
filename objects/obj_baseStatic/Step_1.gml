if self.state == fsm_mob.none or self.state == fsm_mob.broken or game.app.state != fsm_game.play then
	exit
	
self.step += 1	
	
var looking = p_looking() * -20

if place_meeting(x, y + looking, obj_player) begin
	/// Interagir
	if game.app.input.key_interact and self.state == fsm_mob.idle then
		event_user(ev_interact_down)
	
	/// Desinteragir
	else if game.app.input.key_interact and self.state == fsm_mob.running then
		event_user(ev_interact_up)
		
	/// Trocar interação
	else if abs(game.app.input.key_axis_switch) then
		event_user(ev_interact_switch)
	
	/// Mostrar menssagem
	event_user(ev_interact_message)
	self.can_interact = true
end

else
	self.can_interact = false
	
#region STEP LITE
if step % 10 then
	event_user(ev_lite_step)
	
#endregion
	
