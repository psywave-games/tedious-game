if background == -1 and game.app.state == fsm_game.play begin
	background = layer_background_get_id(layer_get_id("Background"))
end

#region RESIZE SCREEN
if not (game.app.step % room_speed) begin
	if is_browser then if internal_old_width != browser_width 
		or internal_old_height != browser_height begin 
		resolution_set(mode_resolution, mode_ratio)
		internal_old_height = browser_height
		internal_old_width = browser_width
	end

	else if internal_old_width != display_get_width() 
		or internal_old_height != display_get_height() begin 
		resolution_set(mode_resolution, mode_ratio)
		internal_old_height = display_get_height()
		internal_old_width = display_get_width()
	end
	
end
#endregion

#region DOORS UPDATE
if mode_light_hd and not lite() begin 
	self.doors = 0
	var _count = 0

	with obj_door0 begin 
		other.doors |= (self.state == fsm_mob.running) << _count
		_count += 1
	end
end
#endregion