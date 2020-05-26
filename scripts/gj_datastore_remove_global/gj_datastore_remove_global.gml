/// @description gj_datastore_remove_global(string key)
/// @function gj_datastore_remove_global
/// @param string key
//returns: handle
//Removes the key.
var url="http://gamejolt.com/api/game/v1/data-store/remove/?game_id="+gj_gameid+"&key="+argument0;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,2)
return gj_currhandle;


