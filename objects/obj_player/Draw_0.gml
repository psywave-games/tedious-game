p_draw(x, y, image_xscale, image_yscale, 1.0)

#region PARTICLES
/// PISS 
if self.state == fsm_player.piss begin
	part_piss_stream(part_system, part_piss, x + (image_xscale * 3), yfoot - (image_yscale * 12))
end

/// SONG
if state == fsm_player.guitar_idle or state == fsm_player.guitar_walk begin
	part_song_stream(part_system, part_song, x, y)
end
#endregion