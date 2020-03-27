/// @description ev_lite_step

if self.book_read begin
	if not place_meeting(self.x, self.y, obj_baseBook) begin
		speak_break(self)
		self.book_read = false
	end
end