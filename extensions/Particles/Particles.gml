#define part_piss_install
var _part_type = part_type_create()
part_type_size(_part_type, 0.012, 0.012, 0, 0)
part_type_shape(_part_type, pt_shape_disk)
part_type_alpha3(_part_type, 1, 1, 0)
part_type_speed(_part_type, 0.02, 0.025, 0, 0)
part_type_direction(_part_type, 0, 0, 0, 0)
part_type_gravity(_part_type, 0.002, 270)
return _part_type

#define part_song_install
var _part_type = part_type_create()
part_depth(self.depth - 1)
part_type_sprite(_part_type, pt_song, false, true, true)
part_type_blend(_part_type, bm_add)
part_type_alpha3(_part_type, 0.20, 1, 0.80)
part_type_speed(_part_type, 0.05, 0.2, 0, 0)
part_type_life(_part_type, room_speed, room_speed)
return _part_type

#define part_fire_install
var _part_type = part_type_create()
part_depth(self.depth + 1)
part_type_size(_part_type, 0.008, 0.016, -0.0001, 0)
part_type_shape(_part_type, pt_shape_square)
part_type_alpha2(_part_type, 1.0, 0.80)
part_type_gravity(_part_type, 0.001, 90)
return _part_type

#define part_watter_install
var _part_type = part_type_create()
part_depth(self.depth + 1)
part_type_size(_part_type, 0.012, 0.012, 0, 0)
part_type_shape(_part_type, pt_shape_square)
part_type_gravity(_part_type, 0.002, 270)
part_type_alpha1(_part_type, 0.75)
return _part_type

#define part_depth
if not variable_instance_exists(self.id, "part_system") begin
    self.part_system = part_system_create()
    part_system_depth(self.part_system, argument0)
end

#define part_song_stream
/// @description emmiter particle sound
/// @arg0 part_system
/// @arg1 part_type
/// @arg2 x
/// @arg3 y

var _part_system = argument0
var _part_type = argument1
var _xx = argument2
var _yy = argument3 - 8

if not global.app.render.mode_particles or lite() then
	exit

/// emitir 3 particulas por segundo
if not (global.app.step % (room_speed/2)) begin
	if not variable_instance_exists(self.id, "part_type_sign") then
		part_type_sign = true

	if not variable_instance_exists(self.id, "part_type_emmiter") then
		part_type_emmiter = part_emitter_create(_part_system)

	part_emitter_region(_part_system, part_type_emmiter, _xx - 8, _xx + 8, _yy - 8, _yy + 8, ps_shape_diamond, ps_distr_linear)		
	part_type_sign ^= true
	
	/// alternar direita esquerda
	if part_type_sign then
		part_type_direction(_part_type, 0, 10, 1, 10)
	else
		part_type_direction(_part_type, 180, 170, 1, 10)
		
	part_emitter_burst(_part_system, part_type_emmiter, _part_type, 1)
end

#define part_piss_stream
/// @description emmiter particle sound
/// @arg0 part_system
/// @arg1 part_type
/// @arg2 x
/// @arg3 y

var _part_system = argument0
var _part_type = argument1
var _xx = argument2
var _yy = argument3

if not (game.app.step % (room_speed/4)) begin
    if not variable_instance_exists(self.id, "part_type_emmiter_penis") then
		self.part_type_emmiter_penis = part_emitter_create(_part_system)

    part_system_depth(_part_system, self.in_mob.depth - 1)
    part_emitter_region(_part_system, self.part_type_emmiter_penis, _xx, _xx, _yy, _yy, ps_shape_rectangle, ps_distr_linear)		
    part_emitter_burst(_part_system, self.part_type_emmiter_penis, _part_type, 1)
end