#region GAMEJOLT SESSION
gj_init(
	string(ds_map_find_value(global.data_game, "gamejoltid")),
	string(ds_map_find_value(global.data_game, "gamejolttk"))
)

if gj_user_autologin() then
    gj_session_open()
#endregion