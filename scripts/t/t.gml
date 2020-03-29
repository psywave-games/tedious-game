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
			return "English"
		case msg.menu_lang:
			return "Language:"
		case msg.menu_window:
			return "Display"
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
		case msg.video_outline:
			return "Outline:"
		case msg.video_reflex:
			return "Reflections:"
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
		case msg.interact_book0:
		    return "I do feel some sympathy for people who use Windows"
		case msg.interact_book1:
		    return "especially those who've been using it for a long time."
		case msg.interact_book2:
		    return "There were a lot of bugs in Windows 3.x"
		case msg.interact_book3:
		    return "Windows 95"
		case msg.interact_book4:
		    return "Windows 98"
		case msg.interact_book5:
		    return "Windows 98SE"
		case msg.interact_book6:
		    return "Windows 2000"
		case msg.interact_book7:
		    return "Windows ME"
		case msg.interact_book8:
		    return "Windows XP"
		case msg.interact_book9:
		    return "Windows Vista"
		case msg.interact_book10:
		    return "and even in Windows 7, Windows 8 and Windows 8.1"
		case msg.interact_book11:
		    return "That's why we're going all-out with Windows 10,"
		case msg.interact_book12:
		    return "to get rid of those bugs and replace them with all-new ones."
		case msg.interact_book:
		    return "read the book"
		case msg.psy_chest:
		    return "chest"
		case msg.psy_drawer:
		    return "drawer"
		case msg.interact_loot:
		    return "loot"
		case msg.interact_shower:
		    return "take a shower"
		case msg.primary_f:
		    return "first"
		case msg.primary_m:
		    return "first"
		case msg.secondary_f:
		    return "second"
		case msg.secondary_m:
		    return "second"
		case msg.interact_google:
		    return "search cool agriculture machine"
		case msg.interact_furnace_hurt:
		    return "stick your hand on stove"
		case msg.interact_coffe_freezer_gap:
		    return "grab a coffee cup"
		case msg.interact_coffe_microwave_put:
		    return "put coffee cup in the  microwave"
		case msg.interact_coffe_microwave_gap:
		    return "grab  coffee from microwave"
		case msg.interact_coffe_freezer_put:
		    return "put coffee in the fridge"
		case msg.interact_microwave_down:
		    return "turn on microwave"
		case msg.interact_music_2009:
		    return " play teclado lindinho 2009 music"
		case msg.psy_door:
		    return "door"
		case msg.interact_bible:
			return "read a verse"
		case msg.interact_bible0:
		    return "The big secret is there were five JeJe clones,"
		case msg.interact_bible1:
		    return "and at different points we all said different things."
		case msg.interact_bible2:
		    return "That's why the bible contradicts itself all the time,"
		case msg.interact_bible3:
		    return "because us JeJe clones did"
		case msg.interact_bible4:
		    return "If I am 'the way, truth and life'"
		case msg.interact_bible5:
		    return "then why do all these TV preachers spend all their time peddling their books"
		case msg.interact_bible6:
		    return "instead of preaching from mine?"
		case msg.interact_bible7:
		    return "What the fuck?"
		case msg.interact_bible8:
		    return "Stone gays?"
		case msg.interact_bible9:
		    return "Don't eat shellfish?"
		case msg.interact_bible10: 
		    return "What fucking retard wrote this shit?"
		case msg.interact_bible11:
		    return "Maybe it was that asshole Judas."
		case msg.interact_bible12:
		    return "Dammit, this shit is crazy."
		case msg.gameover_title:
			return "Game Over!"
		case msg.gameover_text:
			return "I'm sorry, your journey was complete, and unfortunatly it ends here. How should we remember you?"
		case msg.credits:
			return "GAME IDEALIZER\nRodrigo Dornelles\n\n\nARTS AND ANIMATIONS\nBernes Veroli Baianor\n\n\nMUSIC\nFelipe Matheus\n\n\nUX AND GENERAL PROGRAMMER\nRodrigo Dornelles\n\nTRANSLATOR AND AUXILIARY PROGRAMMER\nRodrigo Oliveira\n\n\nGAMEPLAY TESTS\nRodrigo Oliveira\n\nGAMEDESIGN AND MAPPING\nBernes Veroli Baianor\nRodrigo Dornelles\n\nCONTENT DIRECTOR\nGabriel Philippe Martins\n\n\nGAMEJAM COORDINATOR\nAndré Young\n\nTHANKS TO ALL WHO TESTED \"THE GAME\"\nJulia Peron\nRobson Lima\nIgor Galindo\nLucas Coelho\nUbiratan Silva\nAdrian Klitzke\nJunio Teixeira\nCleyson Andrade\nCarlos Raimundo\nHenrique Marciano\n\n\nPUBLICITY\nLucas Leite\n\n\nSOUND AND SONOPLASTY\nThiago Reis"
		case msg.memorial:
			return "IN MEMORIAM BY\n" + game.app.nickname + "\n" + msg_date("/")
		case msg.interact_switch:
			return "switch"
		case msg.interact_picture_down:
			return "watching painting"
		case msg.interact_picture_rate:
			return "hm... beautiful painting... or an awful painting? That is a question... "
		case msg.interact_broken:
			return choose("damn! broke it...", "fuck... chineses...", "shit... it's broken. amazon solves it", "third time this week. i will buy another later...")
	end
end
switch argument[0] begin
	case msg.press_start:
		return "pressione enter para jogar"
	case msg.menu_start:
		return game.app.started? "Continuar": "Novo Jogo"
	case msg.pt:
		return "Português"
	case msg.en:
		return  "English"
	case msg.menu_lang:
		return "Idioma:"
	case msg.menu_window:
		return "Exibição"
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
		return "Resolução:"
	case msg.video_digto:
		return "Digitacao:"
	case msg.video_fnthd:
		return "Letras HD:"
	case msg.video_color:
		return "Colorizar:"
	case msg.video_full:
		return "Tela cheia:"
	case msg.video_outline:
		return "Contorno:"
	case msg.video_reflex:
		return "Reflexos:"	
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
		return "Placar dos Líderes"
	case msg.interact_on:
		return "Ligar"
	case msg.interact_off:
		return "Desligar"
	case msg.interact_gap:
		return "Pegar" 
	case msg.menu_config:
		return "Configurações"
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
	case msg.interact_book0:
	    return "como dizia o filosofo piton, que teve como discipulo nada mais nada menos do que karl marx."
	case msg.interact_book1:
	    return "tudo na vida depende do quanto voce quer comer alguem."
	case msg.interact_book2:
	    return "voce trabalha pra comer alguem, voce estuda pra comer alguem, voce usa droga pra comer alguem,"
	case msg.interact_book3:
	    return "voce malha, toma veneno, faz a desgraca toda pra comer alguem, "
	case msg.interact_book4:
	    return "voce vai num show com a intencao de sair de la pra comer alguem,"
	case msg.interact_book5:
	    return "voce faz doacao, voce faz caridade, posta foto da caridade que voce fez no instagram, no face,"
	case msg.interact_book6:
	    return "pras mina olhar: o... ele e caridoso, ele tem pensamento social, ah vou dar pra ele, pra comer alguem desgraca,"
	case msg.interact_book7:
	    return "tudo na vida tem a intencao de comer alguem, a quantidade de vontade que voce quer esfolar uma buceta desgraca,"
	case msg.interact_book8:
	    return "entao nao venha com essa de que a... eu sou, eu sou beneficente, eu sou amigo da comunidade, voce nao e amigo de desgraca nenhuma,"
	case msg.interact_book9:
	    return "voce quer comer alguem rapaz, voce quer fuder pra comer alguem,"
	case msg.interact_book10:
	    return "voce nao estuda, pra ter um emprego bom pra juntar dinheiro pra falar: a... nao sei o que, eu sou bem sucedido."
	case msg.interact_book11:
	    return "voce estuda pra chegar a desgraca, eu tenho dinheiro, eu vou fuder puta, eu vou comer todo mundo desgraca."
	case msg.interact_book12:
	    return "entao a ideia e essa, facam tudo, facam tudo na intencao de esfolar uma buceta desgraaca."
	case msg.interact_book:
	    return "ler o livro"
	case msg.psy_chest:
	    return "bau"
	case msg.psy_drawer:
	    return "gaveta"
	case msg.interact_loot:
	    return "saquear"
	case msg.interact_shower:
	    return "tomar banho"
	case msg.primary_f:
	    return "primeiro"
	case msg.primary_m:
	    return "primeiro"
	case msg.secondary_f:
	    return "segundo"
	case msg.secondary_m:
	    return "segundo"
	case msg.interact_google:
	    return "procurar maquinas agricolas maneiras"
	case msg.interact_furnace_hurt:
	    return " enfiar a mao no fogao"
	case msg.interact_coffe_freezer_gap:
	    return " pegar um copo de cafe"
	case msg.interact_coffe_microwave_put:
	    return " colocar copo de cafe no microondas"
	case msg.interact_coffe_microwave_gap:
	    return "  pegar o copo de cafe do microondas"
	case msg.interact_coffe_freezer_put:
	    return "colocar o copo de cafe na geladeira"
	case msg.interact_microwave_down:
	    return "ligar o microondas"
	case msg.interact_music_2009:
	    return " tocar musica teclado lindinho 2009"
	case msg.psy_door:
	    return "porta"
	case msg.interact_bible:
		return "ler um poema"
	case msg.interact_bible0:
	    return "fiz uma promessa pra mim mesmo nunca mais comer torresmo"
	case msg.interact_bible1:
	    return "alguém me disse, outro dia, que para sentir satisfação e alegria é necessário ser caridoso"
	case msg.interact_bible2:
	    return "me dá um real, me da um real aí joão camainha mainha mania monai"
	case msg.interact_bible3:
	    return "o que fazer se não fazer e aceitar o tédio enfadonho"
	case msg.interact_bible4:
	    return "entao acho a receita de caminhar na caminhada"
	case msg.interact_bible5:
	    return "e subindo o morro, penso na sensação agradável de vir mais rápido na descida pois estou numa bike"
	case msg.interact_bible6:
	    return "corro o risco de tropeçar em mim mesmo e cair quebrando o pescoço"
	case msg.interact_bible7:
	    return "o que o gato disse para o leite antes de bebe-lo? miaaau!"
	case msg.interact_bible8:
	    return "não procure saber onde vou meu caminho é toda manhã"
	case msg.interact_bible9:
	    return "você gosta de maçã? eu também, mas não tem!"
	case msg.interact_bible10: 
	    return "aleluia, aleluia, aleluia!"
	case msg.interact_bible11:
	    return "reze uma ave maria um pai nosso e um graio pai e assim você deverá ser feliz, ser feliz"
	case msg.interact_bible12:
	    return "a felicidade não esta no pico da montanha, está enquanto você escala esta montanha!"
	case msg.gameover_title:
		return "Fim de Jogo!"
	case msg.gameover_text:
		return "Sinto muito, voce cumpriu sua jornada que, infelizmente, acaba aqui! Como devemos lembrar de voce?"
	case msg.credits:
		return "IDEALIZADOR DO JOGO\nRodrigo Dornelles\n\n\nARTES E ANIMAÇÕES\nBernas Veroli Baianor\n\n\nMÚSICA\nFelipe Matheus\n\n\nPROGRAMADOR GERAL E UX\nRodrigo Dornelles\n\nPROGRAMADOR AUXILIAR E TRADUTOR\nRodrigo Oliveira\n\n\nTESTES DE JOGABILIDADE\nRodrigo Oliveira\n\nGAMEDESIGN E MAPA\nBernas Veroli Baianor\nRodrigo Dornelles\n\nDIRETOR DE CONTEUDO\nGabriel Philippe Martins\n\nORGANIZADOR DA GAMEJAM\nAndré Young\n\n\nAGRADECIMENTO A TODOS QUE TESTARAM \"O JOGO\"\nJulia Peron\nRobson Lima\nIgor Galindo\nLucas Coelho\nUbiratan Silva\nAdrian Klitzke\nJunio Teixeira\nCleyson Andrade\nCarlos Raimundo\nHenrique Marciano\n\n\nPUBLICIDADE\nLucas Leite\n\n\nSOM E SONOPLASTIA\nThiago Reis"
	case msg.memorial:
		return "IN MEMORIAM DE\n" + game.app.nickname + "\n" + msg_date("/")
	case msg.interact_switch:
		return "alternar"
	case msg.interact_picture_down:
		return "observar a pintura"
	case msg.interact_picture_rate:
		return "hm... pintura bonita, pintura formosa, pintura bem feita..."
	case msg.interact_broken:
		return choose("ops... quebrado", "hm... vou ligar para a garantia...", "grr... descartável.", "o quê?! eu comprei isso tem 3 semanas")
end

return "#Error 18"
