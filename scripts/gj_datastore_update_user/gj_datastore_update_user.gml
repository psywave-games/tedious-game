/// @description gj_datastore_update_user(string key,string value,string operation)
/// @function gj_datastore_update_user
/// @param string key
/// @param string value
/// @param string operation
//returns: handle
//Set key (argument0) in user data store to data (argument1)
var url="http://gamejolt.com/api/game/v1/data-store/update/",posturl="game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&key="+argument0+"&value="+argument1+"&operation="+argument2;
posturl+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_post_string(url,posturl);
ds_map_add(gj_handletypemap,gj_currhandle,1)
return gj_currhandle;


