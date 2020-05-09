/// @description ev_init

#region ev_init
with game.app.interface event_user(ev_init)
with game.app.render event_user(ev_init)
with game.app.audio event_user(ev_init)
with game.app.input event_user(ev_init)
#endregion

#region VIDEOGAMES MANAGER
/// ligar consoles
if self.state == fsm_game.videogamePlay begin
	for (var i = 0; i < array_length_1d(self.videogames); i++) begin
		self.videogames[i].visible = self.select == i
	end
end

/// desligar consoles
else begin
	for (var i = 0; i < array_length_1d(self.videogames); i++) begin
		self.videogames[i].visible = false
	end
end
#endregion