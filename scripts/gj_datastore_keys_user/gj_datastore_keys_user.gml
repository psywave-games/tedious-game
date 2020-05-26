//gj_datastore_keys_user()
//returns: handle
//Get all keys from the datastore.
var url="http://gamejolt.com/api/game/v1/data-store/get-keys/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,1)
return gj_currhandle;


