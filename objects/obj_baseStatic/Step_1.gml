#region RENDER DISTANCE
if self.persistent_draw then
	visible = true
	
else if point_distance(game.app.render.cammidx, game.app.render.cammidy, self.x, self.y) <= game.app.render.camrange then
	visible = true 
	
else
	visible = false
#endregion

#region IGNORE MOB
if self.state == fsm_mob.none
	or self.state == fsm_mob.broken
	or game.app.state != fsm_game.play 
	or not visible 
	or speaking(game.app.player) begin
		self.can_interact = false
		exit
end
#endregion
	
#region DETECT LOOKING COLISION
var looking = rectangle_in_rectangle(
	bbox_left,
	bbox_top,
	bbox_right,
	bbox_bottom, 
	game.app.player.bbox_left,
	game.app.player.ylooking,
	game.app.player.bbox_right, 
	game.app.player.ylooking
)
#endregion

#region INTERACTS
if game.app.player.state == fsm_player.idle begin

	if looking begin
		/// Interagir
		if game.app.input.key_interact and self.state == fsm_mob.idle begin
			if ++self.switchs >= 2 and self.can_break begin
				self.state = fsm_mob.broken
				speak(game.app.player, t(msg.interact_broken), p_head_direction(bbox_bottom, bbox_top))
				event_user(ev_interact_broken)
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
			self.message = self.message + other.message
			self.can_interact |= true
		end
	end else 
		self.can_interact = false
		
end else
	self.can_interact = false
#endregion

if not (game.app.step % room_speed) begin
	self.switchs = 0
end

#region RELFEX
if can_reflex  and game.app.render.mode_reflex and not lite() begin
	reflex_world = true
	reflex_player = point_in_rectangle(
		game.app.player.x,
		game.app.player.y,
		bbox_left - 32,
		y - (word.height/2),
		bbox_right + 32,
		y + (word.height/2),
	)
end
else begin
	reflex_world = false
	reflex_player = false
end
#endregion

lite_step()