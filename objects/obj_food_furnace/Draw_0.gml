draw(
	sprite_index, color_cinza_b
)

#region OCCUPED SLOTS
var fire_a = game.inventory.item_local_soap == self.object_index
var fire_b = game.inventory.item_local_coffe == self.object_index
var fire_c = game.inventory.item_local_ramen_pan == self.object_index
var fire_d = game.inventory.item_local_ramen_food == self.object_index
var fire_na = not fire_a and not fire_b and not fire_c 

#endregion

#region ITEMS
if fire_a then
	draw_sprite_ext(spr_food_furnace1, image_index, x, y, image_xscale, image_yscale, image_angle, color(color_cinza_d), image_alpha)

if fire_b  then
	draw_sprite_ext(spr_food_furnace2, image_index, x, y, image_xscale, image_yscale, image_angle, color(color_azul_b), image_alpha)

if fire_c then
	draw_sprite_ext(spr_food_furnace3, image_index, x, y, image_xscale, image_yscale, image_angle, color(color_cinza_d), image_alpha)
#endregion	

#region FIRE
if state == fsm_mob.running begin
	/// _anc = _ancora do shape
	var _anc = os_browser != browser_not_a_browser? 1.0: 0.5
	var _xx0 = x - 2 + _anc
	var _xx1 = x + 2 + _anc
	
	part_type_color2(part_fire, color(color_amarelo_b), color(color_vermelho))
	
	if fire_a or fire_na begin
		part_emitter_region(part_system, part_emitter_a, _xx0 - 6, _xx1 - 6, y -6, y -4, ps_shape_diamond, ps_distr_gaussian)	
		part_emitter_burst(part_system, part_emitter_a, part_fire, 3)
	end
	
	if fire_b or fire_na begin
		part_emitter_region(part_system, part_emitter_b, _xx0, _xx1, y -6, y -4, ps_shape_diamond, ps_distr_gaussian)
		part_emitter_burst(part_system, part_emitter_b, part_fire, 3)
	end
	
	if fire_c or fire_na begin
		part_emitter_region(part_system, part_emitter_c, _xx0 + 6, _xx1 + 6, y -6, y -4, ps_shape_diamond, ps_distr_gaussian)
		part_emitter_burst(part_system, part_emitter_c, part_fire, 3)
	end
end	
#endregion

#region BARS
with game.inventory begin
		
	if fire_a and not self.item_ready_soap then
		draw_mob_bar(self, other.x - 6, other.y - 16, 5, "soap")
	
	if fire_b and not self.item_ready_coffe then
		draw_mob_bar(self, other.x, other.y - 16, 5, "coffe")

	if fire_d and self.item_ready_ramen_food then
		draw_mob_bar(self, other.x + 6, other.y -16, 5, "ramen_food")
	
	else if fire_c and not self.item_ready_ramen_pan then
		draw_mob_bar(self, other.x + 6, other.y -16, 5, "ramen_pan")
end
#endregion