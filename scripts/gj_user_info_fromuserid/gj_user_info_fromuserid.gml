/// @description gj_user_info_fromuserid(string userid(s))
/// @function gj_user_info_fromuserid
/// @param string userid(s
//argument0 can be a Comma Separated List
//returns: handle
//Gets user info. 
var url="http://gamejolt.com/api/game/v1/users/?game_id="+gj_gameid+"&user_id="+argument0;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,1)
return gj_currhandle;


