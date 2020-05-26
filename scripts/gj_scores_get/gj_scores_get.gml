/// @description gj_scores_get(string table_id,real limit)
/// @function gj_scores_get
/// @param string table_id
/// @param real limit
//returns: handle
//Get scores from a list
var url="http://gamejolt.com/api/game/v1/scores/?game_id="+gj_gameid+"&table_id="+argument0+"&limit="+string(argument1);
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,3)
return gj_currhandle;


