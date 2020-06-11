/// @desc audio welcome
audio_play_at(game.app.player.x, game.app.player.y, snd_halflife_welcome, false)
state_reset( game.app, fsm_game.cutscene)