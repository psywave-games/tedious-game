/// @arg0 char
var _day = string(current_day) + argument0
var _month = string(current_month) + argument0
var _yearh = string(current_year)

if argument0 == "-" begin
	if current_month < 10 then
		_month = "0" + _month
	if current_day < 10 then
		_day = "0" + _day
end

if game.app.lang == msg.en then
	return _month + _day + _yearh
	
return _day + _month + _yearh