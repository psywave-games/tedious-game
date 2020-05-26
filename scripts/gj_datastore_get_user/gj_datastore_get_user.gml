/// @description gj_datastore_get_user(string key)
/// @function gj_datastore_get_user
/// @param string key
//returns: handle
//Get data from the datastore key of the user.
var url="http://gamejolt.com/api/game/v1/data-store/?format=dump&game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&key="+argument0;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,4)
return gj_currhandle;


