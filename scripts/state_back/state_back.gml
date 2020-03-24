
with argument0 begin

	if ds_list_empty(self.memento) then 
		return self.state

	var last = ds_list_size(self.memento)
	last -= 1

	self.state = ds_list_find_value(self.memento, last)
	
	ds_list_delete(self.memento, last)

	event_user(ev_init)

end