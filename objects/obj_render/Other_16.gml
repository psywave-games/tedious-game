/// @description ev_lite_step
if background != -1 then
	layer_background_blend(background, color(color_verde_d))
	

else if background == -1 and game.app.state == fsm_game.play begin
	background = layer_background_get_id(layer_get_id("Background"))
end