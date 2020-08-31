if not debug(debug_mode_colision) then
	exit

var _color = c_white

if variable_instance_exists(self, "can_break") then
	if self.can_break then
		_color = self.state == fsm_mob.broken? c_red: c_white
		
draw_set_color(_color)
draw_set_alpha(0.5)
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom, true)