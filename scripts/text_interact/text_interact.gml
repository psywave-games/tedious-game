/// @description interact message
/// @arg0 messages...

var _text = "[F]"

for (var index = 0; index < argument_count; index++) begin
	_text = _text + " " + argument[index]
end

return _text + "\n"