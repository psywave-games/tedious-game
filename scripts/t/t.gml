
/// @see			EN
if game.app.lang == msg.en begin
	switch argument[0] begin
	
		case msg.press_start:
			return "press enter to start"
	
		case msg.en:
			return  "English"
	
		case msg.menu_lang:
			return "Language:"
	
		case msg.menu_video:
			return "Graphics"
		
		case msg.menu_audio:
			return "Sound"

		case msg.back:
			return "return"
		
		case msg.video_palete:
			return "Pallete:"
	
		case msg.video_ratio:
			 return "Ratio:"
	
		case msg.video_size:
			return "Resolution:"
			
		case msg.video_digto:
			return "Text Speed:"
	
		case msg.video_fnthd:
			return "Fonts HD:"
	
		case msg.video_color:
			return "Colorize:"
	
		case msg.video_full:
			return "FullScreen:"
			
		case msg.beta:
			return "WARNING: This game is a low demo,\nthe game is not finished because the programmer drank too much.\n THKX!"
		
	
	end
end
switch argument[0] begin

	case msg.press_start:
		return "precione enter para jogar"
	
	case msg.pt:
		return "Portugues"
	
	case msg.menu_lang:
		return "Idioma:"
		
	case msg.menu_video:
		return "Graficos"
		
	case msg.menu_audio:
		return "Audios"
			
	case msg.back:
		return "voltar"
	
	case msg.video_palete:
		return "Paleta:"
	
	case msg.video_ratio:
		 return "Janela:"
	
	case msg.video_size:
		return "Resolucao:"
		
	case msg.video_digto:
		return "Digitacao:"
	
	case msg.video_fnthd:
		return "Letras HD:"
	
	case msg.video_color:
		return "Colorizar:"
	
	case msg.video_full:
		return "Tela cheia:"
		
	case msg.beta:
		return "ATENCAO: este jogo e uma demo muito inicial,\n o jogo nao esta concluido porque o programador bebeu demais.\n obrigado!"

end







return "#Error 18"