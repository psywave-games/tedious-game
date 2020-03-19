/// caso o jogo esteja fora do estado que exiba menssagens
/// não sera computado como texto exibido
if game.app.state != fsm_game.play and game.app.state != fsm_game.cutscene then 
	exit 
	
/// computar frame de textos
self.speak_step += 1

/// renderizar texto de fala
if self.speak_init <= self.speak_step and self.speak_step < self.speak_finish begin
		
		/// se a velocidade de digitação não for instanea, renderizar conforme steps
		if game.app.render.font_speed < 10 begin

			#region TEXT RANGE
			/// calcular o texto que sera exibido ( aumentar gradualmente )		
			var _text_speed = 4 / game.app.render.font_speed /// velocidade do texto
			var _current = (self.speak_step - self.speak_init) / _text_speed //// tempo passado
			var _eos = clamp (_current, 1, string_length(self.speak_text)) /// ultimo caracter
		
			#endregion
			
			/// extrair texto da fala
			var _text = string_copy(self.speak_text, 0, round(_eos)) /// copiar do primeiro ao ultimo caracter conforme o tempo passado
		end 
		/// velocidade maxima
		else begin 
			/// texto instantaneo
			_text = self.speak_text
		end

		
		
		switch self.speak_mode begin
		
			
		
			#region TOP HEAD TEXT
			default:
			
				/// configurar texto
				draw_set_font(fnt_game1)
				draw_set_valign(fa_bottom)
				draw_set_halign(fa_center)
			
				/// posicionar texto
				var _xx = self.x
				var _yy = self.y - 16
				
				/// dimencionar texto
				var _size = 0.3
				
				/// colorir texto
				var _color = game.app.color[15]
				
				/// renderizar
				draw_text_transformed_color(_xx, _yy, _text, _size, _size, 0, _color, _color, _color, _color, 1)	
				break
			#endregion
		end
		
		
end