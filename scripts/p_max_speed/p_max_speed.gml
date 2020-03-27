/// @description retorna a velocidade maxima do jogador de acordo com seu animgo

/// velocidade padrão
var _max = 5

/// limitar velocidade maxima
if game.app.happy <= 50 then 
 _max = clamp(game.app.happy * 0.04, 0.75, 5)

/// não bugar anim de correr
if _max > 1.8 and _max < 2.2 then
	_max = 1.8

/// retornar correndo/caminhando
return clamp(game.app.input.key_run? 5: 1.5, 0, _max)