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
/// pitch gameplay music
if game.app.state == fsm_game.play and music_playing_is(snd_music_happy) begin
	var _music = music_playing_get()
	var _pitch = clamp(round(game.app.happy/8)*0.16, 0.48, 1)
	audio_sound_pitch(_music, _pitch)
end

/// fad out music dying
if game.app.player.state == fsm_player.dying begin
	var _volume = gain_get(volume_music) * anim_fadein(game.app.player.image_index, 0, 4)
	audio_sound_gain(music_playing_get(), _volume, 0)
end
#endregion

#region SOUND MUSIC CREDITS FADOUT
if game.app.state == fsm_game.credits begin
	var _volume = gain_get(volume_music) * anim_fadein(game.app.interface.step, room_speed * 99, room_speed)
	audio_sound_gain(music_playing_get(), _volume, 0)
end
#endregion