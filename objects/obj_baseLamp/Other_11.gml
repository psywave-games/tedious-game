/// @description ev_interact_down

#region TURN ON LIGHT
with obj_baseLamp begin
	if self.channel == other.channel then
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