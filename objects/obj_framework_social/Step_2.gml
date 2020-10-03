#region SURVIVAL CRON
if game.app.state == fsm_game.play or game.app.state == fsm_game.insider then
	global.time_survival += delta_time
#endregion


#region HALF-LIFE
if  game.app.state == fsm_game.play then if game.app.input.key_interact then if secret(thematic_halflife) begin
	if game.app.interface.can_interact then
		audio_play_at(game.app.player.x, game.app.player.y, snd_halflife_done, false)
	else 
		audio_play_at(game.app.player.x, game.app.player.y, snd_halflife_deny, false)
end
#endregion
#region TECH-HOUSE
if not (game.app.step % (room_speed/4)) then if secret(thematic_tuntunt) then
	game.app.render.color_invert = irandom(color_normal)
#endregion