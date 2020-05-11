if show_debug(1) begin
	draw_set_alpha(0.5)
	draw_set_color(c_white)
	draw_rectangle(bbox_left,ylooking,bbox_right,ylooking, false)
	draw_rectangle(x, yfoot, x, yhead, false)
end