/// @arg0 mob
/// @arg1 variable
/// @arg2 value

var _mob = argument0
var _variable = argument1
var _value = argument2
var _points = variable_instance_get(_mob, _variable)

if _points > 0 begin
	variable_instance_set(_mob, _variable, _points - _value)
	score_add(_value)	
end
