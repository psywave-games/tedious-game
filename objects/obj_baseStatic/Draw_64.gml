if self.state == fsm_mob.broken or self.state == fsm_mob.none or game.app.state != fsm_game.play then
	exit
	
if self.can_interact and os_browser != browser_not_a_browser and not lite() begin 
	draw_set_font(fnt_game1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text_ext_transformed(10, 0, "[F] " + self.message, 16, display_get_gui_width() -10, 2.0, 2.0, 0)
end