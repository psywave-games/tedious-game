/// @description gj_trophy_add(string trophy_id)
/// @function gj_trophy_add
/// @param string trophy_id
//returns: handle
//Add a trophy
var url="http://gamejolt.com/api/game/v1/trophies/add-achieved/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&trophy_id="+argument0;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,2)
return gj_currhandle;


