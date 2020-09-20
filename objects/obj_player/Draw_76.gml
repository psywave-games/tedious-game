#region EASETEGG MOONWALK
if game.app.input.key_moonwalk and state == fsm_player.walk and abs(hspeed) < 2 begin
	unlock(trophy.moonwwalk)
	image_xscale *= -1
end
#endregion