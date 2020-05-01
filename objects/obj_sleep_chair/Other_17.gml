/// @description ev_interact_using

if obj_sleep_table.state == fsm_mob.running and not (game.app.step % room_speed) then
	mob_score_add(self, "points", 20)		