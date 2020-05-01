/// not process if not have a player
if not instance_exists(obj_player) then
	exit

/// position player
audio_listener_position(game.app.player.x, game.app.player.ylooking, 0)

for (var e = 0; e < array_length_1d(emitter); e++) begin
	/// doppler effect
	audio_emitter_velocity(emitter[e], game.app.player.hspeed, 0, 0)
end