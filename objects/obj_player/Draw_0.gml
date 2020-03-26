if game.app.input.key_moonwalk and state == fsm_player.walk and abs(hspeed) < 2 then
	image_xscale *= -1

p_draw(x, y, image_xscale, image_yscale, 1.0)