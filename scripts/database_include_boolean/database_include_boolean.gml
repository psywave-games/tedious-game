/// @script data_include_boolean
/// @arg0 object.id
/// @arg1 variable
/// @arg3 save
var _object = argument0
var _variable_name = argument1
var _save = argument2

#region DATABASE GLOBAL
if _object == database_global begin
	var _variable_value = bool(variable_global_get(_variable_name))

	if not _save then
		_variable_value = bool(ini_read_real(database_global, _variable_name, _variable_value))
	
	ini_write_string(database_global, _variable_name, string(_variable_value))
	variable_global_set(_variable_name, _variable_value)
end
#endregion
#region DATABASE OBJECT
else begin
	var _object_name = object_get_name(_object.object_index)
	var _variable_value = bool(variable_instance_get(_object, _variable_name))
	var _ini_section = string_delete(_object_name, 1, 4)
	var _ini_keyname = _variable_name
	_ini_section = string_replace(_ini_section, "_", " ")

	if not _save then
		_variable_value = bool(ini_read_real(_ini_section, _ini_keyname, _variable_value))

	ini_write_string(_ini_section, _ini_keyname, string(_variable_value))
	variable_instance_set(_object, _variable_name, _variable_value)
end
#endregion