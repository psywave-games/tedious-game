
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
		case msg.warn_title: 
			return "W A R N I N G"
		case msg.warn_text:
			return "This game contains sensitive content which some people may find offensive or disturbing. The production is not a proposal for encourage suicide, but an opportunity to value life. If you need help call to the Brazilian Hot Line of Life Valorize Center at +55 188, or International Hot Line at NUMBER +1 514 333 8823."	
		case msg.esrb:
			return "Implied Violence\nUse Alcohol\nUse Drugs\nBlack humor\nSuicide"
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
		   return lite()? "Tedious Simulator [Lite]": "Tedious Simulator"
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
		case msg.interact_suicide_power:
		   return "Sticks a fork in the outlet"
		case msg.video_camspeed:
		   return "Cam Speed"
		case msg.menu_audio_geral:
		    return "Master Volume"
		case msg.menu_audio_music:
		    return "Music Volume"
		case msg.menu_audio_sfx:
		    return "SFX Volume" 
		case msg.interact_music_sandstorm:
		    return "play sandstorm music"
		case msg.interact_sleep_down:
		    return "sleep in bed"
		case msg.interact_open:
		    return "open"
		case msg.interact_close:
		    return "close"
		case msg.interact_videogame:
		    return "play a game"
		case msg.interact_music_despacitos:
		    return "play despacito music"
		case msg.interact_sit_down:
		    return "sit on the"  
		case msg.interact_sit_up:
		    return "get up"
		case msg.interact_shit_down:
		    return "pooping in the toilet"
		case msg.interact_shit_up:
		    return "clean yourself"
		case msg.interact_urine_down:
		    return "piss in toilet"
		case msg.interact_urine_up:
		    return "close zipper"
		case msg.interact_clog_papper:
		    return "clog toilet"
		case msg.interact_cooler_glasses:
		    return "put sunglasses"
		case msg.interact_music_turn_it:
		    return "play turn down for what music"
		case msg.interact_drink_water:
		    return "drink water"
		case msg.interact_furnace_gas:
		    return "turn on gas"
		case msg.interact_furnace_fire:
		    return "turn on stove" 
		case msg.interact_furnace_off:
		    return "turn off stove"
	
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
	case msg.warn_title:
		return "A V I S O"
	case msg.warn_text:
		return "Este jogo contem conteudo sensivel que algumas pessoas podem achar ofensivo ou perturbador. A producao nao e uma proposta de incentivo ao suicidio, mas uma oportunidade de valorizar a vida. Se precisar de ajuda, procure por atendimento ligando para o Centro de Valorizacao da Vida no Brasil no numero +55 188, ou utilize a linha internacional para Valorizacao da Vida +1 514 333 8823."
	case msg.esrb:
		return "Violencia Implicita\nUso de Alcool\nUso de Drogas\nHumor Negro\nSuicidio"
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
		return lite()? "Simulador de Tedio [Lite]": "Simulador de Tedio"
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
	case msg.interact_suicide_power:
		return "Enfiar o garfo na tomada"
	case msg.video_camspeed:
		return "Cam Speed"
	case msg.menu_audio_geral:
	    return "volume geral"
	case msg.menu_audio_music:
	    return "volume da musica"
	case msg.menu_audio_sfx:
	    return "volume SFX" 
	case msg.interact_music_sandstorm:
	    return "tocar musica sandstorm"
	case msg.interact_sleep_down:
	    return "dormir na cama"
	case msg.interact_open:
	    return "abrir"
	case msg.interact_close:
	    return "fechar"
	case msg.interact_videogame:
	    return "jogar um jogo"
	case msg.interact_music_despacitos:
	    return " tocar musica despacito"
	case msg.interact_sit_down:
	    return "sentar em " 
	case msg.interact_sit_up:
	    return "levantar"
	case msg.interact_shit_down:
	    return "cagar no vaso"
	case msg.interact_shit_up:
	    return "se limpar"
	case msg.interact_urine_down:
	    return "mijar no vaso"
	case msg.interact_urine_up:
	    return "fechar ziper"
	case msg.interact_clog_papper:
	    return "clog toilet"
	case msg.interact_cooler_glasses:
	    return "colocar oculos escuros"
	case msg.interact_music_turn_it:
	    return "tocar música turn down for what"
	case msg.interact_drink_water:
	    return "beber agua"
	case msg.interact_furnace_gas:
	    return "ligar o gas"
	case msg.interact_furnace_fire:
	    return "acender o fogao" 
	case msg.interact_furnace_off:
	    return "apagar o fogao"
end

return "#Error 18"