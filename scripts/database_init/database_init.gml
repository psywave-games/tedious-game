ini_open(database_file)

#region DATABASE VALIDATE|CREATE
if ini_read_string(database_global, "version", "") != GM_version begin
	file_delete(database_file)
	database_create()
end
#endregion

ini_close()