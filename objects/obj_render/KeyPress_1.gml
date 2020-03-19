/// @description Insert description here
// You can write your code in this editor


/// verificar se tecla [C] foi apertada
/// se estiver apertada siginifica que o player pretende trocar a paleta de cor
if keyboard_check( ord("C" ) ) begin 
	/// looping 1 => paletas de cores
	for ( var index = 1 ; index <= 10; index ++ ) begin
		
		/// tecla [1,2,3,4,5,7,8,9]
		var key_number = index == 10? ord("0"): ord( string(index) )
		
		/// a tecla numerica não for pressionada
		if not keyboard_check_pressed(key_number) then
			continue 
			
		/// alterar paleta de cores
		self.mode = index - 1
		
		/// iniciar paleta de cores
		init
		
		/// fim do codigo
		break
	end
end