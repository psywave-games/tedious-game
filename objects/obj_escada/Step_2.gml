/// @description profundidade


/// alterar profundidade do corrimão
layer_set_visible(fundo, game.app.player.escada == 0)	
layer_set_visible(frente, game.app.player.escada != 0)

lite_step()
