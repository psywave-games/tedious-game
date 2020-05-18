/// @description ev_interact_up

self.state = fsm_mob.idle
image_speed = -1

audio_stop(snd_door_open)
audio_play(x, y, snd_door_close, false)