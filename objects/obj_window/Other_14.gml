/// @description ev_interact_message

if self.state == fsm_mob.idle then
	self.message = t(msg.interact_open) + " " + t(msg.psy_ruindows)

else 
	self.message = t(msg.interact_close) + " " + t(msg.psy_ruindows)


#region LADO DO TEXTO
if game.app.player.x > self.x begin
	message_halign = fa_left
	message_x = 16
end else begin
	message_halign = fa_right
	message_x = -16
end
#endregion