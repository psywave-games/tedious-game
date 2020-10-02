#region BACKEGROUND
draw_set_alpha(light_vgn)
draw_set_color(c_black)
draw_rectangle(vgn_x(0), vgn_y(0), vgn_x(480), vgn_y(240), false)

draw_set_color(c_white)
draw_rectangle(vgn_x(0), vgn_y(0), vgn_x(480), vgn_y(240), true)
#endregion

#region PLAYER MOVE
player = clamp( (player + (game.app.input.vgn_axis_z * 6)), 36, 204)
draw_set_color(c_white)
draw_rectangle(
	vgn_x(4), 
	vgn_y(player - 32), 
	vgn_x(8), 
	vgn_y(player + 32), 
	false
)
#endregion

#region BALL MOVE
if ball_x >= 0 begin
	draw_set_color(c_white)
	draw_circle(vgn_x(ball_x), vgn_y(ball_y), 8, false)
end 

ball_x += ball_hspeed 
ball_y += ball_vspeed
#endregion

#region BALL COLISION
if ball_y <= 4 or ball_y >= 236 then
	ball_vspeed *= -1

if ball_x >= 472 then
	ball_hspeed *= -1
#endregion

#region BALL BOUNCE
if rectangle_in_circle(4, player - 32, 8, player + 32, ball_x, ball_y, 4) begin
	myscore += score_vgn(10)
	ball_hspeed = min(abs(ball_hspeed) * 1.1, 6)
	ball_vspeed = clamp(ball_vspeed + lerp(-1, 1, (ball_y - player) / 64), -ball_hspeed, ball_hspeed)
end
#endregion


#region GAMEOVER
if ball_x <= 0 begin
	draw_set_text_config(fnt_game1, c_white, 1.0, fa_center, fa_middle)
	draw_text(vgn_x(240), vgn_y(120), t(msg.gameover_title))
	if ball_x < -500 then event_user(ev_mygame_restart)
end
#endregion