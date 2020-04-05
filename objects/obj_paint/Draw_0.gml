var _alpha =  clamp(1 - sad(), 0, 0.7)
draw(spr_paint1, color_verde_a)

draw_sprite_ext(spr_paint2, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, _alpha)