/// @description ev_init
event_all(ev_init)

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

#region ROOM MANAGER
switch self.state begin
	/// house map
	case fsm_game.play:
		if room != rm_level0 then
			room_goto(rm_level0)
		break


	/// intro map
	case fsm_game.intro:
		if room != rm_intro then
			room_goto(rm_intro)
		break
end
#endregion