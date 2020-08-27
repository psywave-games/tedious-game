/// @description ev_interact_using

if game.app.step % (room_speed * 2) then
	exit

#region RATE LIGHT ON
if game.app.player.darkness < 0.5 begin
	speak(game.app.player, t(msg.interact_light_rate2))
	score_add(-15)
	exit
end
#endregion

#region RATE SLEEP FULL
if game.app.player.requirements[need.sleep] < 10 begin
	speak(game.app.player, t(msg.interact_sleep_full))
	score_add(-15)
	exit
end
#endregion

#region SLEEPING
game.app.player.requirements[need.sleep] -= 15
score_add(10)
#endregion