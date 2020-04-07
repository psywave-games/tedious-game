/// @description text [Q] [E] switch interact in ev_interact_message
/// @arg0 min
/// @arg1 max

var _text = ""

/// verificar alternar esquerda
if argument0 < self.select 
	_text = _text + "[Q] "

/// verificar alternar direita
if argument1 > self.select 
	_text = _text + "[E] "

return  _text + t(msg.interact_switch) + "\n"
