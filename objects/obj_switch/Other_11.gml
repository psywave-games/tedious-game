/// @description ev_interact_down

#region TURN ON LIGHT
state = fsm_mob.running

with instance_nearest(x, y - 16, obj_baseLamp) begin
	self.state = fsm_mob.running
end
#endregion

#region ADD POINTS
if points >= 0 begin
	score_add(points)
	points -= 10
end
#endregion