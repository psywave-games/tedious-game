/// @description ev_lite_step

if book_read begin
	if not place_meeting(x,y, game.app.player) begin
		speak_break(game.app.player)
		book_read = false
	end
end