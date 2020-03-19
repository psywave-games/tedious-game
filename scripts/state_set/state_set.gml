/// @arg0 object
/// @arg1 state

with argument0 begin
	
	ds_list_add(self.memento, self.state)
	self.state = argument1

	init
end