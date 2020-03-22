/// @description Insert description here
// You can write your code in this editor



draw_sprite_ext(spr_tv0, 0, x, y, image_xscale, image_yscale, 0, c_maroon, 1)

#region TELA

/// ligada
if self.state != fsm_obj.idle begin
	draw_sprite_ext(spr_tv1, 0, x, y, image_xscale, image_yscale, 0, c_white, 1)
	draw_lensflare(x+7,y-6, 2, 0.8, 1.4, 0, choose(3,4,10),choose(0.5,0.6,0.7))
end 
/// desligado
else 
	draw_sprite_ext(spr_tv1, 0, x, y, image_xscale, image_yscale, 0, c_black, 1)

#endregion

draw_sprite_ext(spr_tv2, 0, x, y, image_xscale, image_yscale, 0, c_purple, 1)


