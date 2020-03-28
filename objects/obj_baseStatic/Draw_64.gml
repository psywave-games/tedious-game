if self.state == fsm_mob.broken or self.state == fsm_mob.none or not show_interface() then
	exit
	
if self.can_interact begin
	draw_set_font(fnt_game0)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text_ext_transformed(10, 0, "[F] " + self.message, 16, display_get_gui_width() -10, 2.0, 2.0, 0)
end