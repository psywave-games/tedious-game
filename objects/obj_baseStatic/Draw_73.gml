if self.state == fsm_obj.broken or self.state == fsm_obj.none then
	exit
	

draw_set_font(fnt_game1)
draw_set_halign(fa_center)
draw_text_transformed(x, y -16, t(self.name), 0.04, 0.04, 0)