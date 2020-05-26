/// @description gj_user_info_fromusername(string username)
/// @function gj_user_info_fromusername
/// @param string username
//returns: handle
//Gets user info. 
var url="http://gamejolt.com/api/game/v1/users/?game_id="+gj_gameid+"&username="+argument0;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,1)
return gj_currhandle;


