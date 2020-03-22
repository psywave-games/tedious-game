#region INPUTS
axis_x = game.app.input.key_axis_x
#endregion


#region COLISON HORIZOTAL
var next_x = self.x + (16 * axis_x)

/// não sair do mapa horizontalmente
if next_x < word.limit_left or next_x > word.limit_right begin
	axis_x = 0
	hspeed = 0
end

#endregion





