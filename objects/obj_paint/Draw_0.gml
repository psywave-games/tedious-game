var _alpha =  clamp(1 - sad(), 0, 0.7)
draw(art - 1, image_blend)

draw_sprite_ext(art, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, _alpha)