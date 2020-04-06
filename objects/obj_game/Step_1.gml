#region COUNT
self.step += 1

if self.state == fsm_game.play begin

	self.step_play += 1

	if self.happy > 0 and not (self.step_play % room_speed) then
		self.happy -= 1
end
#endregion

#region GAME OVER
if game.app.player.state == fsm_player.died and game.app.state == fsm_game.play begin
	time_speedrun_end = current_time
	music_play(0, sound_music_menu)
	sfx_play(0,0, sound_sfx_shoot)
	state_reset(game.app, fsm_game.over)
end
#endregion

#region CLOCK
if not (self.step % (room_speed * 2)) and self.state == fsm_game.play begin
	global.minute += 1

	if global.minute >= 60 begin
		global.minute = 0
		global.hour += 1
	end
	
	if global.hour >= 24 then
		global.hour = 0
end
#endregion