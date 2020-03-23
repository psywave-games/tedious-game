
var _olhar = p_looking() * 14
var _lado = sign(self.image_xscale)

if _lado then 
	return 360 - _olhar
	
else
	return _olhar 
	