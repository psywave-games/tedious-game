/// @description ev_interact_swich

var _last = self.state != fsm_mob.running? 2: 3 
var _sign = game.app.input.key_axis_switch
var _next = self.select + _sign

if _next <= 0 or _next > _last then
	exit
	
self.select = _next

if self.state == fsm_mob.running then
	audio_play(x,y, snd_pc_switch, false)