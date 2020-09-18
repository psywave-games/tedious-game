/// @description Insert description here
// You can write your code in this editor

global.cheat = false
global.time_speedrun = current_time
global.time_survival = 0
global.replay = variable_global_exists("replay")

self.fun = 0
self.fun |= (2 * (current_time == 3 and current_time <= 3) )
self.fun |= (4 * (!irandom(2) and global.replay) )
self.fun |= (8 * (!irandom(100000)) )
self.fun |= (16 * (!irandom(10000)) )
self.fun |= (128 * (current_day == 13 and current_weekday == 5) )
self.fun |= (256 * (!irandom(10) and current_day == 1 and current_month == 4) )
self.fun |= (512 * (!irandom(20000)) )