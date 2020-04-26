draw(
	sprite_index, color_cinza_c
)

if state == fsm_mob.running begin
	gpu_set_blendmode(bm_add)
	draw_sprite(spr_food_sugar1, 0, x, y)
	gpu_set_blendmode(bm_normal)
end