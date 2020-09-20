/// @arg0 char
var _lang = argument_count > 1? argument[1]: game.app.lang
var _comma = argument[0]
var _day = string(current_day) + _comma
var _month = string(current_month) + _comma
var _yearh = string(current_year)

if _comma == "-" begin
	if current_month < 10 then
		_month = "0" + _month
	if current_day < 10 then
		_day = "0" + _day
end

if _lang == msg.en then
	return _month + _day + _yearh
	
return _day + _month + _yearh