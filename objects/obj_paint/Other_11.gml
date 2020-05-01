/// @description ev_interact_use

speak(game.app.player, t(msg.interact_picture_rate), p_head_direction(bbox_top, bbox_bottom))

state = fsm_mob.none
score_add(50)
