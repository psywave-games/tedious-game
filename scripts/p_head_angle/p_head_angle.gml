
var _olhar = 0
var _lado = sign(self.image_xscale)

if game.app.player.escada != 0 then 
	_olhar -= game.app.player.escada * 14

else if game.app.input.key_axis_y != 0 then 
	_olhar -= game.app.input.key_axis_y * 14


#region RETURN
if _lado then 
	return _olhar 

else 
	return 360 - _olhar
#endregion