/// @description ev_init

if self.state == fsm_game.load begin
	database_init()

	/// focar a primeira vez
	if not variable_global_exists("focus") then
		global.focus = true

	/// em computar ou segunda vez não precisa focar
	if browser() and global.focus then
		state_reset(self.id, fsm_game.waitFocus)
		
	/// carregar idioma
	else 
		lang_load()
end