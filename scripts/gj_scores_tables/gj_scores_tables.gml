//gj_scores_tables()
//returns: handle
//Get all highscore tables in your game
var url="http://gamejolt.com/api/game/v1/scores/tables/?game_id="+gj_gameid;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,1)
return gj_currhandle;


