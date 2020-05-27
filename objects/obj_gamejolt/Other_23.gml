/// @description ev_mygame_end

var _time_speedrun = current_time - global.time_speedrun
var _time_survival = global.time_survival/1000
var _score = "score: "+ score_get_string(score)
var _play = text_cron(_time_survival)
var _run = text_cron(_time_speedrun)

gj_scores_add(gamejolt_score_survive, _play, _time_survival, GM_version)
gj_scores_add(gamejolt_score_speedrun, _run, _time_speedrun, GM_version)
gj_scores_add(gamejolt_score_points, _score, score, GM_version)