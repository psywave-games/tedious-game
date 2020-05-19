/// @descripition pass event for surprise engine to manager easereggs

var _event = argument0

with game.app.surprises begin
	in_mob = other.id
	in_pass = false
	in_object = other.object_index
	event_user(_event)
	alarm_set(_event, 1)
end

if not game.app.surprises.in_pass then
	event_user(_event)