/// @descripion rank scoreboard
/// @arg0 id

var _id = argument0
var _score = argument1
var _sort = argument2

if global.cheat then 
	exit

var _scores = ds_map_find_value(global.data_scores, ds_map_find_first(global.data_scores))
for (var i = 0, j = ds_list_size(_scores); i < j; i++) begin
	var _json = ds_list_find_value(_scores, i)
	if ds_map_find_value(_json, "id") == _id begin
		/// get data
		var _title = string(ds_map_find_value(_json, "name"))
		var _token = string(ds_map_find_value(_json, "gamejolt"))
		var _guest = bool(ds_map_find_value(_json, "guest"))
		
		/// update rank
		if not _guest then gj_scores_add(_token, _score, _sort, GM_version)
		else gj_scores_add_guest(_token,  _score, _sort, GM_version, game.app.nickname)
		
		/// notify rank
		show_debug_message("====== RANK ======")
		show_debug_message("Title: " +  string(_title))
		show_debug_message("Score: " +  string(_score))
		show_debug_message("Sort: " + string(_sort))
	break end
end


