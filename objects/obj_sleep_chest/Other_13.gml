/// @description ev_interact_switch
select = clamp(select + game.app.input.key_axis_switch, 1, broken? 1: 2)
can_break = select == 2