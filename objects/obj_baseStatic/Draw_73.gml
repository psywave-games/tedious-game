if self.state == fsm_mob.broken or self.state == fsm_mob.none or game.app.state != fsm_game.play then
	exit
	
if self.can_interact begin 
	draw_set_font(fnt_game1)
	draw_set_halign(fa_center)
	draw_set_valign(fa_bottom)
	draw_text_ext_transformed(x, y -16, "[F] " + self.message, 16, 64, 0.2, 0.2, 0)
end