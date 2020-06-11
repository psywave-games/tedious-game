/// @description ev_interact_down

self.state = fsm_mob.running
image_speed = 1

audio_stop(snd_door_close)
audio_play_at(x, y, snd_door_open, false)