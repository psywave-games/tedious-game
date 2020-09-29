/// @descripion unlocker achiviements
/// @arg0 id

var _id = argument0

if global.cheat then 
	exit
	
/// already unlocked
if global.achiviements >> _id & 1 then
	exit
	
/// add achievement
global.achiviements |= 1 << _id

var _achiviements = ds_map_find_value(global.data_achiviements, ds_map_find_first(global.data_achiviements))
for (var i = 0, j = ds_list_size(_achiviements); i < j; i++) begin
	var _json = ds_list_find_value(_achiviements, i)
	if ds_map_find_value(_json, "id") == _id begin
		/// get data
		var _title = string(ds_map_find_value(_json, "name"))
	
		/// save achievement gamejolt
		gj_trophy_add(string(ds_map_find_value(_json, "gamejolt")))
		
		/// notify rank
		show_debug_message("====== TROPHY ======")
		show_debug_message("Title: " +  string(_title))
	break end
end