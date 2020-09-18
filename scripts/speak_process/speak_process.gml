/// caso o jogo esteja fora do estado que exiba menssagens
/// não sera computado como texto exibido
if not show_interface() and game.app.state != fsm_game.cutscene then 
	exit 
	
/// computar frame de textos
self.speak_step += 1
var _time = lerp(0.8, 2, game.app.render.font_time/10)

/// renderizar texto de fala
if self.speak_init <= self.speak_step and self.speak_step <= (self.speak_finish * _time) begin
	/// se a velocidade de digitação não for instanea, renderizar conforme steps
	if game.app.render.font_speed < 10 begin

		/// calcular o texto que sera exibido ( aumentar gradualmente )		
		var _text_speed = 4 / game.app.render.font_speed /// velocidade do texto
		var _current = (self.speak_step - self.speak_init) / _text_speed //// tempo passado
		var _eos = clamp (_current, 1, string_length(self.speak_text)) /// ultimo caracter
		
		/// tocar som de voz
		if not voice_playing_any() and self.speak_step < self.speak_finish then
			voice_play(string_copy(self.speak_text, round(_eos), 1))
			
		/// extrair texto da fala
		var _text = string_copy(self.speak_text, 0, round(_eos)) /// copiar do primeiro ao ultimo caracter conforme o tempo passado
	end 
	/// velocidade maxima
	else begin 
		/// texto instantaneo
		_text = self.speak_text
	end

	draw_set_text_config(fnt_game1, c_white, 1.0, fa_center, fa_bottom)
		
	/// posicionar texto
	var _display_height = is_mobile? display_get_gui_height()/2: display_get_gui_height()
	var _size = is_mobile? 2.0: 1.2
	var _xx = (self.x - game.app.render.camx) * (display_get_gui_width()/camera_get_view_width(view_camera[0]))
	var _yy = (self.yhead - (8.2 * self.image_yscale) - game.app.render.camy) * (_display_height/camera_get_view_height(view_camera[0])) 
	
	/// renderizar
	draw_text_ext_transformed(_xx, _yy, _text, 16, 256, _size, _size, 0)	
end