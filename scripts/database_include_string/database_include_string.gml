/// @arg0 object.id
/// @arg1 variable
/// @arg3 load
var _save = argument2
var _object = argument0
var _object_name = object_get_name(_object.object_index)
var _variable_name = argument1
var _variable_value = variable_instance_get(_object, _variable_name)
var _ini_section = string_delete(_object_name, 1, 4)
var _ini_keyname = _variable_name
_ini_section = string_replace(_ini_section, "_", " ")

if not _save then
	_variable_value = ini_read_string(_ini_section, _ini_keyname, _variable_value)

ini_write_string(_ini_section, _ini_keyname, _variable_value)
variable_instance_set(_object, _variable_name, _variable_value)