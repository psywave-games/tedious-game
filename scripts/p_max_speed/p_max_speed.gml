/// @description retorna a velocidade maxima do jogador de acordo com seu animgo



var _speed = 5
var _max = game.app.input.key_run? 5: 1.5

return clamp(_speed, 0.5, _max)