/// @description ev_lite_step

if self.book_read begin
	if not collision_rectangle(bbox_left, yfoot - 32, bbox_right, yfoot, obj_baseBook, false, true) begin
		speak_break(self)
		self.book_read = false
	end
end