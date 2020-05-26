//gj_scores_add(string table_id,string scorestring, real scoresort, string extra_data, string GuestName)
//returns: handle
//Add a score
var url="http://gamejolt.com/api/game/v1/scores/add/?game_id="+gj_gameid+"&guest="+argument4+"&table_id="+argument0+"&score="+string(argument1)+"&sort="+string(argument2)+"&extra_data="+argument3;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,2)
return gj_currhandle;


