/// @arg0 name
/// @arg1 local
/// @arg2 ready

variable_instance_set(self, "item_local_" + string(argument0), argument1)
variable_instance_set(self, "item_ready_" + string(argument0), argument2 * room_speed)
variable_instance_set(self, "item_maxbar_" + string(argument0), abs(argument2) * room_speed)