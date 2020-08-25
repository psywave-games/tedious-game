if background == -1 and game.app.state == fsm_game.play begin
	background = layer_background_get_id(layer_get_id("Background"))
end