/// @description gj_trophy_get(optional bool achieved)
/// @function gj_trophy_get
/// @param optional bool achieved
//returns: handle
//Get all trophies. If argument0==true, only achieved trophies, if argument0==false, only not-achieved trophies, if argument0 not provided, all trophies
if(argument_count==1)
{
    if!(argument[0])
    {
        var url="http://gamejolt.com/api/game/v1/trophies/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&achieved=false";
    }
    else
    {
        var url="http://gamejolt.com/api/game/v1/trophies/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&achieved=true"; 
    }
}
else
var url="http://gamejolt.com/api/game/v1/trophies/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token;
url+="&signature="+md5_string_utf8(url+gj_privatekey)
var gj_currhandle=http_get(url);
ds_map_add(gj_handletypemap,gj_currhandle,1)
return gj_currhandle;


