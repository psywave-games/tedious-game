gj_init("478388", "810d041ed39a0594fb8131c748fe86a0")

if gj_user_autologin() then
    gj_session_open()
	
else 
	show_message_async("[!] Error to conect Gamejolt.")