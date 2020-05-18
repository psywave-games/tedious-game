/// @description camera
// You can write your code in this editor

if not p_exists() then
	exit
	
var _xx = 0
var _yy = 0
var _xxt = 0
var _yyt = 0
	
var vw = camera_get_view_width(view_camera[0])	/// view width
var vh = camera_get_view_height(view_camera[0]) /// view height

var rw_count = round(room_width/vw)				/// count room widths
var rh_count = round(room_height/vh)			/// count room heights
	
#region AMBIENT FOLLOW
if self.mode_camera >= 3 begin
	/// interval x
	for (var i = 0; i < rw_count; i++) begin
		_xx = (room_width/rw_count)
		_xxt = i * _xx
			
		if game.app.player.x < _xxt + _xx then 
			break
	end
		
	/// interval y
	for (var i = 0; i < rh_count; i++) begin
		_yy = (room_height/rh_count) + 8
		_yyt = (i * _yy) + (word.height - 36)
			
		if game.app.player.yhead < _yyt + _yy then 
			break
	end
end		
#endregion
	
#region CAMERA MOVE
switch self.mode_camera begin

	/// soft follow player
	case 0:
		self.camx += (game.app.player.x - (vw/2) - self.camx) * 0.12
		self.camy += (game.app.player.yhead - (vh/2) - self.camy - 8) * 0.12
		break

	/// soft follow eyes 
	case 1:
		self.camx += (game.app.player.x - (vw/2) - self.camx) * 0.12
		self.camy += (game.app.player.ylooking - (vh/2) - self.camy - 8) * 0.04
		break
		
	/// instant follow player
	case 2:
		self.camx = game.app.player.x - (vw/2)
		self.camy = game.app.player.yhead - 8 - (vh/2)
		break
		
	/// instant change room
	case 3:
		self.camx += (_xxt - self.camx) * 0.24
		self.camy += (_yyt - self.camy) * 0.24
		break
		
	/// soft change room
	case 4:
		self.camx += (_xxt - self.camx) * 0.06
		self.camy += (_yyt - self.camy) * 0.06
		break
	
	
	/// super soft change room
	case 5:
		/// se a camera estiver se mechendo na horizontal entrar em modo espera
		self.camwait = abs(clamp(_xxt, 0, room_width - vw) - self.camx) >= 1 and game.app.player.in_stair == 0
		self.camx += (_xxt - self.camx) * 0.04
		self.camy += (_yyt - self.camy) * 0.04
		break
end
#endregion

#region CAMERA POSITION SET
self.camx = clamp(self.camx, 0, room_width - vw)
self.camy = clamp(self.camy, 0, room_height - vh)

camera_set_view_pos(view_camera[0], self.camx, self.camy)
#endregion
	
#region CAMERA EFFECTS
/// fazer camera tremer quando tiver terremoto
if game.app.earthquake > 0 begin
	/// nivel de ruido
	var _range_shake = game.app.earthquake/2
		
	/// adicionar ruido na camera
	self.camx += random_range( - _range_shake, _range_shake)
	self.camy += random_range( - _range_shake, _range_shake)
		
	/// diminuir terremoto
	game.app.earthquake = max(game.app.earthquake - 0.1, 0)
end
#endregion