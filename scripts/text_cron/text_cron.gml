/// @description convert milliseconds to minute:seccond:millies
/// @argument milli

var _millie_count = round( (argument0 % 1000) / 100)
var _millie_text = _millie_count >= 10? string(_millie_count): "0" + string(_millie_count)

var _second_count = round(argument0 / 1000 % 60)
var _second_text = _second_count >= 10? string(_second_count): "0" + string(_second_count)

var _minute_count = round(argument0 / (1000 * 60) % 60)
var _minute_text = _minute_count >= 10? string(_minute_count): "0" + string(_minute_count)

var _hour_count = round(argument0 / (1000 * 60 * 60) % 24)

if _hour_count begin 
	_minute_text = _second_count >= 10? _minute_text: "0" + _minute_text
	return string(_hour_count) + ":" + _minute_text + ":" + _second_text + ":" + _millie_text
end

return _minute_text + ":" + _second_text + ":" + _millie_text