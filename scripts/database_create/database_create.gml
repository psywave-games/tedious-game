/// @description create database file

ini_open(database_file)
ini_write_string(database_global, "version", GM_version)
ini_write_string(database_global, "updated", date_date_string(GM_build_date))
ini_close()