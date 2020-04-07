/// @description ev_interact_message

if self.state == fsm_mob.idle then
	self.message = text_interact(t(msg.interact_open), t(msg.psy_door))

else 
	self.message = text_interact(t(msg.interact_close), t(msg.psy_door))

#region LADO DO TEXTO
if game.app.player.x > self.x begin
	message_halign = fa_left
	message_x = 6
end else begin
	message_halign = fa_right
	message_x = -6
end
#endregion