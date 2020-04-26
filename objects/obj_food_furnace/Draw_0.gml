draw(
	sprite_index, color_cinza_b
)

#region OCCUPED SLOTS
var fire_a = game.inventory.item_local_soap == self.object_index
var fire_b = game.inventory.item_local_coffe == self.object_index
var fire_c = game.inventory.item_local_ramen_pan == self.object_index
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

	part_type_color3(part_fire, c_white, color(color_amarelo_b), color(color_vermelho))
	
	if fire_a or fire_na begin
		part_emitter_region(part_system, part_emitter_a, x - 8, x - 4, y -6, y -4, ps_shape_diamond, ps_distr_linear)	
		part_emitter_burst(part_system, part_emitter_a, part_fire, 4)
	end
	
	if fire_b or fire_na begin
		part_emitter_region(part_system, part_emitter_b, x - 2, x + 2, y -6, y -4, ps_shape_diamond, ps_distr_linear)
		part_emitter_burst(part_system, part_emitter_b, part_fire, 4)
	end
	
	if fire_c or fire_na begin
		part_emitter_region(part_system, part_emitter_c, x + 4, x + 8, y -6, y -4, ps_shape_diamond, ps_distr_linear)
		part_emitter_burst(part_system, part_emitter_c, part_fire, 4)
	end
end
#endregion

