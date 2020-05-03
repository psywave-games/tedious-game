/// @description emmiter particle sound
/// @arg0 x
/// @arg1 y

var xx = argument0
var yy = argument1 - 8
	
part_system_depth(part_system, depth - 5)
part_emitter_region(part_system, part_emitter_guitar, xx - 8, xx + 8, yy - 8, yy + 8, ps_shape_diamond, ps_distr_linear)	
		
/// emitir 3 particulas por segundo
if not (game.app.step % (room_speed/2)) begin
	part_song_sign ^= true
	
	/// alternar direita esquerda
	if part_song_sign then
		part_type_direction(part_song, 350, 360, 1, 10)
	else
		part_type_direction(part_song, 180, 190, 1, 10)
	
	part_emitter_burst(part_system, part_emitter_guitar, part_song, 1)
end