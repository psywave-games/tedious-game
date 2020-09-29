if visible then if state == fsm_mob.running then if game.app.player.state == fsm_player.guitar_idle 
	or game.app.player.state == fsm_player.guitar_walk begin
	unlock(trophy.guitarhero)
end