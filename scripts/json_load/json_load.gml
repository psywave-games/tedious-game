/// @desc open file and return json
var _file = file_text_open_read(argument0) 
var _text = ""

while not file_text_eof(_file) begin 
	_text += file_text_readln(_file)
end	

file_text_close(_file)

return json_decode(_text)