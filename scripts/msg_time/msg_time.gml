/// @arg0 real

var _hour = argument0? current_hour: global.hour
var _minute = argument0? current_minute: global.minute
var _day = _hour >= 12? " pm": " am"

_hour = string_repeat("0", _hour < 10) + string(_hour)
_minute = string_repeat("0", _minute < 10) + string(_minute)

return _hour + ":" + _minute + _day