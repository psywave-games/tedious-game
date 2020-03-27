draw_set_blend_mode(c_yellow)

if self.state == fsm_mob.running begin
	draw_lensflare(x,y, 0, 0.5, 0.5, 0, 0, random(20)? 0.6: 0.4)
	draw_lensflare(x,y, 0, 2, 2, 0, 0, 0.2)
end

draw(sprite_index, c_yellow)