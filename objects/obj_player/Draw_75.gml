/// @description todo remove sit message
if not lite_and_pc() then
	speak_process()
	
if state == fsm_player.sit begin
	draw_set_font(fnt_game0)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text_ext_transformed(10, 0, "[F] " + t(msg.interact_sit_up), 16, display_get_gui_width() -10, 2.0, 2.0, 0)
end