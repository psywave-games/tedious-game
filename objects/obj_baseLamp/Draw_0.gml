if self.state == fsm_mob.running and game.app.player.y >= self.y begin
	draw_lensflare(x,y, 0, 0.5 * image_xscale, 0.5 * image_yscale, 0, 0, random(20)? 0.6: 0.4)
	draw_lensflare(x,y, 0, 2 * image_xscale, 2 * image_yscale, 0, 0, 0.2)
end
