/// @description gj_init(string game id,string private key)
/// @function gj_init
/// @param string game id
/// @param string private key
//Init GameJolt Achievement API. Provide the Game ID and the private key.
globalvar gj_user,gj_token,gj_gameid,gj_privatekey,gj_handletypemap,gj_infomap,gj_tempuser,gj_temptoken;
gj_user=""
gj_token=""
gj_gameid=argument0;
gj_privatekey=argument1;
gj_handletypemap=ds_map_create()
gj_infomap=ds_map_create()
gj_tempuser=""
gj_temptoken=""


