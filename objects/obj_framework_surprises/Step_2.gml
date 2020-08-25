if game.app.state != fsm_game.play then
	exit

#region HALF LIFE USE SOUND
if game.app.input.key_interact and self.select == thematic.halflife begin
	if game.app.interface.can_interact then
		audio_play_at(game.app.player.x, game.app.player.y, snd_halflife_done, false)
	else 
		audio_play_at(game.app.player.x, game.app.player.y, snd_halflife_deny, false)
end
#endregion