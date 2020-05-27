/// @description convert milliseconds to minute:seccond:millies
/// @argument milli

var _hour_count = argument0/3600000
var _hour_rest = argument0%3600000
var _hour_text = string(round(_hour_count))

var _minute_count = _hour_rest/60000
var _minute_rest = _hour_rest%60000
var _minute_text = string(round(_minute_count))

var _second_count = _minute_rest/1000
var _second_rest = _minute_rest%1000
var _second_text = _second_count > 10? string(round(_second_count)): "0" + string(round(_second_count))

var _millie_count = _second_rest/10
var _millie_text = _millie_count > 10? string(round(_millie_count)): "0" + string(round(_millie_count))

if _hour_count begin 
	_minute_text = _second_count > 10? _minute_text: "0" + _minute_text
	return _hour_text + ":" + _minute_text + ":" + _second_text + ":" + _millie_text
end

return _minute_text + ":" + _second_text + ":" + _millie_text