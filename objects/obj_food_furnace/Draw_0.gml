draw(
	sprite_index, color_cinza_b
)

#region OCCUPED SLOTS
var _fire = state == fsm_mob.running 
var _fire_a = game.inventory.item_local_soap == self.object_index
var _fire_b = game.inventory.item_local_coffe == self.object_index
var _fire_c = game.inventory.item_local_ramen_pan == self.object_index
var _fire_d = game.inventory.item_local_ramen_food == self.object_index
var _fire_na = not _fire_a and not _fire_b and not _fire_c 
#endregion

#region ITEMS
if _fire_a then
	draw_sprite_ext(spr_food_furnace1, image_index, x, y, image_xscale, image_yscale, image_angle, color(color_cinza_d), image_alpha)

if _fire_b  then
	draw_sprite_ext(spr_food_furnace2, image_index, x, y, image_xscale, image_yscale, image_angle, color(color_azul_b), image_alpha)

if _fire_c then
	draw_sprite_ext(spr_food_furnace3, image_index, x, y, image_xscale, image_yscale, image_angle, color(color_cinza_d), image_alpha)
#endregion	

#region FIRE
if _fire and game.app.render.mode_particles begin
	/// _anc = _ancora do shape
	var _anc = os_browser != browser_not_a_browser? 1.0: 0.5
	var _xx0 = x - 2 + _anc
	var _xx1 = x + 2 + _anc
	
	part_type_color2(part_fire, color_amarelo_b, color_vermelho)
	
	if _fire_a or _fire_na begin
		part_emitter_region(part_system, part_emitter_a, _xx0 - 6, _xx1 - 6, y -6, y -4, ps_shape_diamond, ps_distr_gaussian)	
		part_emitter_burst(part_system, part_emitter_a, part_fire, 3)
	end
	
	if _fire_b or _fire_na begin
		part_emitter_region(part_system, part_emitter_b, _xx0, _xx1, y -6, y -4, ps_shape_diamond, ps_distr_gaussian)
		part_emitter_burst(part_system, part_emitter_b, part_fire, 3)
	end
	
	if _fire_c or _fire_na begin
		part_emitter_region(part_system, part_emitter_c, _xx0 + 6, _xx1 + 6, y -6, y -4, ps_shape_diamond, ps_distr_gaussian)
		part_emitter_burst(part_system, part_emitter_c, part_fire, 3)
	end
	
	if self.state == fsm_mob.running and surface_exists(game.app.render.surface_darkness) begin
		surface_set_target(game.app.render.surface_darkness)
		draw_set_blend_mode(bm_subtract)
		draw_roundrect_color_ext(x - 16, y - 14, x + 16, y + 3, 16, 16, choose(0xAAAAAA, 0xBABABA, 0x999999), c_black, false)
		surface_reset_target()
		draw_set_blend_mode(bm_normal)
	end
	
end	
#endregion

#region BARS
with game.inventory begin
		
	if _fire_a and not self.item_ready_soap then
		draw_mob_bar(self, other.x - 6, other.y - 16, 5, "soap")
	
	if _fire_b and not self.item_ready_coffe then
		draw_mob_bar(self, other.x, other.y - 16, 5, "coffe")

	if _fire_d and self.item_ready_ramen_food then
		draw_mob_bar(self, other.x + 6, other.y -16, 5, "ramen_food")
	
	else if _fire_c and not self.item_ready_ramen_pan then
		draw_mob_bar(self, other.x + 6, other.y -16, 5, "ramen_pan")
end
#endregion

#region BOCAS DO FOGÃO
var _color_a = (not game.app.render.mode_particles or lite()) and (_fire_a or _fire_na) and _fire? c_red: c_black
var _color_b = (not game.app.render.mode_particles or lite()) and (_fire_b or _fire_na) and _fire? c_red: c_black
var _color_c = (not game.app.render.mode_particles or lite()) and (_fire_c or _fire_na) and _fire? c_red: c_black
draw_sprite_ext(spr_food_furnace4, image_index, x, y, image_xscale, image_yscale, image_angle, _color_a, image_alpha)
draw_sprite_ext(spr_food_furnace5, image_index, x, y, image_xscale, image_yscale, image_angle, _color_b, image_alpha)
draw_sprite_ext(spr_food_furnace6, image_index, x, y, image_xscale, image_yscale, image_angle, _color_c, image_alpha)
#endregion