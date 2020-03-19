/// @description camera
// You can write your code in this editor


if instance_exists(game.app.player) and game.app.state = fsm_game.play begin 

	self.camx += (game.app.player.x - (view_wport[0]/2) - self.camx) * 0.5
	self.camy += (game.app.player.y - (view_hport[0]/2) - self.camy) * 0.5


	self.camx = clamp(self.camx, 0, room_width - view_wport)
	self.camy = clamp(self.camy, 0, room_height - view_hport)
	
	
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
	
	
	camera_set_view_pos(view_camera[0], self.camx, self.camy)
end