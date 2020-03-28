/// @description text [Q] [E] switch interact in ev_interact_message
/// @arg0 min
/// @arg1 max

var _text = "\n"

/// verificar alternar esquerda
if argument0 >= self.select 
	_text = _text + "[E] "

/// verificar alternar direita
if argument1 <= self.select 
	_text = _text + "[Q] "

/// concatenar texto
self.message = self.message + _text + t(msg.interact_switch)

return _text
