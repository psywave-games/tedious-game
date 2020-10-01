/// @description ev_init
event_all(ev_init)

#region BOOTSTRAP GAME
/// LOAD GAME CONFIGS
if self.state == fsm_game.loading begin
	web_splashscreen()
	database_init()
	eula_init()
	state_reset( self.id, fsm_game.loaded)
end
/// UPDATE GAME CONFIGS
else if self.state == fsm_game.loaded begin 
	/// focar a primeira vez
	if not variable_global_exists("focus") then
		global.focus = true

	/// em computar ou segunda vez não precisa focar
	if browser() and global.focus then
		state_reset(self.id, fsm_game.waitFocus)
		
	/// carregar idioma
	else lang_load()
end
#endregion
#region VIDEOGAMES MANAGER
/// ligar consoles
if self.state == fsm_game.insider begin
	for (var i = 0, j = last_game; i <= j; i++) begin
		self.videogames[i].visible = self.in_videogame == i
	end
end

/// desligar consoles
else begin
	for (var i = 0, j = last_game; i <= j; i++) begin
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
#region DATABASE SAVE
if self.state == fsm_game.credits
	or self.state == fsm_game.menuOptions 
	or self.state == fsm_game.menuMain
	begin
	database_update(true)
end
#endregion