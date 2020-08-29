var _file = "EULA.txt"
var _text = ""

/// verify eula
if global.eula then 
	exit

/// load eula
#region LOAD FILE EULA.TXT
_file = file_text_open_read(_file)
while not file_text_eof(_file) begin
    _text += file_text_readln(_file)
end
file_text_close(_file)
#endregion

/// show eula
if browser() begin
	/// @todo modal eula
end
else begin
	show_message_async(_text)
end

global.eula = true

/// save eula
/// pode ser que o player não entenda o porque da eula então reinicie o jogo, então já vai estar salvo como lido
ini_open(database_file)
database_include_boolean(database_global, "eula", true)
ini_close()