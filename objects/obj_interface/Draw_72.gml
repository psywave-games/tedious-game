/// @description camera
// You can write your code in this editor

if instance_exists(game.app.player) and game.app.state = fsm_game.play begin 

#region CAMERA
	var vw = camera_get_view_width(view_camera[0]) / 2;
	var vh = camera_get_view_height(view_camera[0]) / 2;

	self.camx += (game.app.player.x - vw - self.camx) * 0.2
	self.camy += (game.app.player.y - vh - self.camy) * 0.2


	self.camx = clamp(self.camx, 0, room_width - vw)
	self.camy = clamp(self.camy, 0, room_height - vh)
	
	
	/// fazer camera tremer quando tiver terremoto
	if game.app.earthquake > 0 begin
		/// nivel de ruido
		var _range_shake = game.app.earthquake/2
		
		/// adicionar ruido na camera
		self.camx += random_range( - _range_shake, _range_shake)
		self.camy += random_range( - _range_shake, _range_shake)
		
		/// diminuir terremoto
		game.app.earthquake -= 0.1
	end
	
	show_debug_message(camy)
	
	
	
	camera_set_view_pos(view_camera[0], self.camx, self.camy)
#endregion

end
