/// @description ev_interact_swich

var _sign = game.app.input.key_axis_switch
var _next = self.select + _sign
	
if _next == 0 or _next > 2 then
	exit
	
	
self.select = _next



