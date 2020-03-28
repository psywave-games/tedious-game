var volume = argument[0]? 1/(10-argument[0]): 0

for (var index = 0; index < argument_count; index++) begin
	var channel = argument[index]
	var sound = game.app.audio.sound[channel]

	if sound != 0 then
		audio_sound_gain(sound, volume, 0)
end