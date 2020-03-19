/// @description Insert description here
// You can write your code in this editor
#region IMAGE ANGLE
var _image_angle = image_angle + self.angle_fix + direction

do begin
	_image_angle -= 360
end until _image_angle <= 360
#endregion

draw_sprite_ext(self.sprite0, image_index, x, y, image_xscale, image_yscale, _image_angle, game.app.color[self.color0], self.alpha)
draw_sprite_ext(self.sprite1, image_index, x, y, image_xscale, image_yscale, _image_angle, game.app.color[self.color1], self.alpha)