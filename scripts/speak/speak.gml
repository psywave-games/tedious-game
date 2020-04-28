/// @description speak sentence
/// @arg0 id
/// @arg1 text
/// @arg2 OPTIONAL_looking

with argument[0] begin 

	var _text = argument[1]
	var _val = self.speak_step + string_length(_text) * 2.4
	var _min = self.speak_step + room_speed/1.6
	var _max = self.speak_step + (room_speed * 5)
	var _look = argument_count > 2? argument[2]: 0

	self.speak_init = self.speak_step
	self.speak_finish = clamp(_val, _min, _max)

	self.speak_ylooking = _look
	self.speak_text = _text
end