/// @description ev_mygame_end

var _time_speedrun = current_time - global.time_speedrun
var _time_survival = global.time_survival/1000
var _score = "Score: " + text_number(score)
var _play = text_cron(_time_survival)
var _run = text_cron(_time_speedrun)


rank(scoreboard.points, _score, score)
rank(scoreboard.survival, _play, _time_survival)
rank(scoreboard.speedrun, _run, _time_speedrun)