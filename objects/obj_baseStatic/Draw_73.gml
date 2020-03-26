if self.state == fsm_mob.broken or self.state == fsm_mob.none or game.app.state != fsm_game.play then
	exit
	
if self.can_interact and os_browser == browser_not_a_browser or lite() begin 
	draw_set_font(fnt_game1)
	draw_set_halign(self.message_halign)
	draw_set_valign(self.message_valign)
	draw_text_ext_transformed(x + self.message_x, y + self.message_y, "[F] " + self.message, 16, 64, 0.2, 0.2, 0)
end