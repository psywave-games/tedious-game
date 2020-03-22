
/// @see			EN
if game.app.lang == msg.en begin
	switch argument[0] begin
	
		case msg.press_start:
			return "press enter to start"
			
		case msg.menu_start:
			return game.app.started? "Continue": "New Game"
			
		case msg.pt:
			return "Portuguese"
	
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
		
		case msg.menu_exit:
		   return "exit"
		case msg.scorebord:
		   return "scoreleaders"
		case msg.interact_on:
		   return "turn on"
		case msg.interact_off:
		   return "turn off "
		case msg.interact_gap:
		   return "grab" 
		case msg.menu_config:
		   return "options"
		case msg.game_name:
		   return"Tedious Simulator"
		case msg.video_lighthd:
		   return "HD Lights"
		case msg.psy_light:
		   return"Light"
		case msg.psy_bed:
		   return"Bed"
		case msg.psy_tv:
		   return"Television"
		case msg.psy_freezer:
		   return"Refrigerator"
		case msg.psy_radio:
		   return"Radio"
		case msg.psy_furnace:
		   return"Stove"
		case msg.psy_microwave:
		   return"Microwave"
		case msg.psy_chair:
		   return"Chair"
		case msg.psy_laterna:
		   return"Flashlight"
		case msg.psy_ruindows:
		   return"Window"
		case msg.psy_instagram:
		   return"Toilet"
		case msg.psy_power:
		   return"Outlet"
		case msg.psy_switch:
		   return"Switch"
		case msg.suicide_power:
		   return "Sticks a fork in the outlet"
		case msg.video_camspeed:
		   return "Cam Speed"
	
	end
end
switch argument[0] begin

	case msg.press_start:
		return "precione enter para jogar"
		
	case msg.menu_start:
			return game.app.started? "Continuar": "Novo Jogo"
	
	case msg.pt:
		return "Portugues"
	
	case msg.en:
		return  "English"
	
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

	case msg.menu_exit:
		return "Sair"
	case msg.scorebord:
		return "Placar dos Lideres"
	case msg.interact_on:
		return "Ligar"
	case msg.interact_off:
		return "Desligar"
	case msg.interact_gap:
		return "Pegar" 
	case msg.menu_config:
		return "Configuracoes"
	case msg.game_name:
		return"Simulador de Tedio"
	case msg.video_lighthd:
		return "Luzes em HD"
	case msg.psy_light:
		return"Luzes"
	case msg.psy_bed:
		return"Cama"
	case msg.psy_tv:
		return"Televisao"
	case msg.psy_freezer:
		return"Geladeira"
	case msg.psy_radio:
		return"Radio"
	case msg.psy_furnace:
		return"Fogão"
	case msg.psy_microwave:
		return"Microondas"
	case msg.psy_chair:
		return"Cadeira"
	case msg.psy_laterna:
		return"Laterna"
	case msg.psy_ruindows:
		return"Janela"
	case msg.psy_instagram:
		return"Toilet"
	case msg.psy_power:
		return"Tomada"
	case msg.psy_switch:
		return"Interruptor"
	case msg.suicide_power:
		return "Enfiar o garfo na tomada"
	case msg.video_camspeed:
		return "Cam Speed"

end







return "#Error 18"