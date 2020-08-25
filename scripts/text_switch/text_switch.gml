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
	
if argument0 > argument1 or self.select < argument0 or self.select > argument1 then
	return _text = "#Error_QE_" + string(argument0) + "_" + string(self.select) + "_" + string(argument1)

return string_length(_text)? (_text + t(msg.interact_switch) + "\n"): ""