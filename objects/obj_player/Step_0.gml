

if abs(self.axis_x) begin
	self.state = fsm_player.walk
end
else begin
	self.state = fsm_player.idle
end