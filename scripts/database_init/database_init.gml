#region DATABASE VERSION LOAD
ini_open(database_file)
var _save_version = ini_read_string(database_global, "version", "")
ini_close()
#endregion
#region DATABASE VALIDATE|CREATE
if _save_version != GM_version begin
	file_delete(database_file)
	ini_open(database_file)
	ini_write_string(database_global, "version", GM_version)
	ini_write_string(database_global, "updated", date_date_string(GM_build_date))
	ini_close()
end
#endregion
#region DATABASE CONFIG LOAD
database_update(false)
#endregion