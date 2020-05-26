/// @description gj_scores_add(string key,string data)
/// @function gj_scores_add
/// @param string key
/// @param string data
//returns: handle
//Set key (argument0) in data store to data (argument1) in the data store of the user
var url="http://gamejolt.com/api/game/v1/data-store/set/",posturl="game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&key="+argument0+"&data="+argument1;
posturl+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_post_string(url,posturl);
ds_map_add(gj_handletypemap,gj_currhandle,2)
return gj_currhandle;


