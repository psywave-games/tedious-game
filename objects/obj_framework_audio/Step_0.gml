/// not process if not have a player
if not instance_exists(obj_player) then
	exit

#region SOUND FX
/// position player
audio_listener_position(game.app.player.x, game.app.player.ylooking * 3, 0)

for (var e = 0; e < array_length_1d(emitter); e++) begin
	/// doppler effect
	audio_emitter_velocity(emitter[e], abs(game.app.player.hspeed), 0, 0)
end
#endregion

#region SOUND MUSIC GAMEPLAY
if game.app.state == fsm_game.play  and music_playing_is(snd_music_happy) begin
	var _music = music_playing_get()
	var _pitch = clamp(round(game.app.happy/8)*0.1, 0.4, 1)

	audio_sound_pitch(_music, _pitch)
end
#endregion