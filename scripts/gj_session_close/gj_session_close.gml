/// @description gj_session_close()
/// @function gj_session_close
//returns: handle
//Close session
var url="http://gamejolt.com/api/game/v1/sessions/close/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,2)
return gj_currhandle;


