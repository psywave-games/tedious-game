/// @description gj_datastore_remove_user(string key)
/// @function gj_datastore_remove_user
/// @param string key
//returns: handle
//Removes the key from the user data store.
var url="http://gamejolt.com/api/game/v1/data-store/remove/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&key="+argument0;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,2)
return gj_currhandle;


