/// @descrpiton retorna o nivel de tedio, ou negativo
if game.app.player.state == fsm_player.dying then
	return 2
else
	return clamp((100-game.app.happy)/100, 0, 1)