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
		#region DATA GET
		var _title = string(ds_map_find_value(_json, "name"))
		#endregion
	
		#region GAMEJOLT UNLOCK
		gj_trophy_add(string(ds_map_find_value(_json, "gamejolt")))
		if os_browser != browser_not_a_browser then web_achievement(_title)
		#endregion
		
		
		#region LOG
		show_debug_message("====== TROPHY ======")
		show_debug_message("Title: " +  string(_title))
		#endregion
	break end
end