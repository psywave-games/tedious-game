/// @description ev_interact_down

#region TURN ON LIGHT
state = fsm_mob.running

with instance_nearest(x, y - 16, obj_baseLamp) begin
	self.state = fsm_mob.running
end
#endregion

#region ADD POINTS
if global.points_switch > 0 begin
	score_add(1)
	global.points_switch -= 1
end
#endregion

sfx_play(x, y, sound_sfx_click)