/// @arg0 object
/// @arg1 state

with argument0 begin
	ds_list_clear(self.memento)
	ds_list_add(self.memento, self.state)
	self.state = argument1

	event_user(ev_init)
end