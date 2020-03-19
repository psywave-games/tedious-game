/// @description Insert description here
// You can write your code in this editor


var _nextx = hspeed + x + (sign(hspeed) * image_xscale * 32)
var _nexty = vspeed + y + (sign(vspeed) * image_yscale * 32)




#region DETECT OUT MAP
/// coordenadas limite
var _outmap = _nextx < 0 or _nexty < 0
_outmap |= _nextx > room_width or _nexty > room_height 

/// verificar se saiu do mapa
if _outmap begin
	self.state_ia = fsm_ia_boss.sleep /// parar ataque
	game.app.earthquake = 5 /// fazer terremoto
end
#endregion