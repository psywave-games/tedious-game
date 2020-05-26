/// @description gj_datastore_set_global(string key,string data)
/// @function gj_datastore_set_global
/// @param string key
/// @param string data
//returns: handle
//Set key (argument0) in data store to data (argument1)
var url="http://gamejolt.com/api/game/v1/data-store/set/",posturl="game_id="+gj_gameid+"&key="+argument0+"&data="+argument1;
posturl+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_post_string(url,posturl);
ds_map_add(gj_handletypemap,gj_currhandle,2)
return gj_currhandle;


