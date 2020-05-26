/// @description gj_user_login(string username,string user_token)
/// @function gj_user_login
/// @param string username
/// @param string user_token
//returns: handle
//Auth the user. Check for the result in the async event.
var url="http://gamejolt.com/api/game/v1/users/auth/?game_id="+gj_gameid+"&username="+argument0+"&user_token="+argument1;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
gj_tempuser=argument0
gj_temptoken=argument1
ds_map_add(gj_handletypemap,gj_currhandle,0)
return gj_currhandle;


