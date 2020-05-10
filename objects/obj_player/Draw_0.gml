#region EASETEGG MOONWALK
if game.app.input.key_moonwalk and state == fsm_player.walk and abs(hspeed) < 2 then
	image_xscale *= -1
#endregion

p_draw(x, y, image_xscale, image_yscale, 1.0)

#region PARTICLES

/// Jogador Mijando
if self.state == fsm_player.piss and  not (game.app.step % (room_speed/4)) begin
	var xx = x + (image_xscale * 3)
	var yy = yfoot - (image_yscale * 12)
	
	part_system_depth(part_system, in_mob.depth - 1)
	part_type_color3(part_piss, color(color_amarelo_b), color(color_amarelo_b), color(color_amarelo_a))
	part_emitter_region(part_system, part_emitter_penis, xx, xx, yy, yy, ps_shape_rectangle, ps_distr_linear)		
	part_emitter_burst(part_system, part_emitter_penis, part_piss, 1)
end



if state == fsm_player.guitar_idle or state == fsm_player.guitar_walk then
	part_song_stream(x, y)
#endregion