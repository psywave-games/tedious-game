/// @description Insert description here
// You can write your code in this editor


if game.app.state != fsm_game.play begin
	speed = 0
	return void
end

#region MOVIMENTAÇÃO
switch self.state_ia begin

	case fsm_ia_boss.sleep:
		speed = 0
		break
		
	case fsm_ia_boss.attack0:
		speed = 15
		break
		
	case fsm_ia_boss.attack1:
		
		self.attack1_step += 1
		
		/// começar
		if self.state_attack1 == fsm_attack.none begin
			self.state_attack1 = fsm_attack.prepare	
			self.alpha = 0.1
			self.color0 = 7
			self.color1 = 7
		end 	
		/// subir marreta
		else if self.state_attack1 == fsm_attack.prepare begin
			image_xscale += 1 // subir martelo
			image_yscale += 1 // subir martelo
				
			if image_xscale > 4 begin
				self.state_attack1 = fsm_attack.wait 
				self.attack1_end = self.attack1_step + 120
			end
		end
		/// começar a atacar
		else if self.state_attack1 == fsm_attack.wait and self.attack1_step > self.attack1_end begin
			self.state_attack1 = fsm_attack.ing
			self.alpha = 1.0
			self.color0 = 1
			self.color1 = 3
		end
		/// descer a marreta
		else if  self.state_attack1 == fsm_attack.ing begin
			image_xscale -= 1
			image_yscale -= 1
			
			if image_xscale <= 1 begin	
				self.state_ia = fsm_ia_boss.sleep /// parar ataque
				game.app.earthquake = 10 /// fazer terremoto
			end
		end
		break
		
end
#endregion

#region VISUAL
if self.state_ia != fsm_ia_boss.attack1 begin
	self.state_attack1 = fsm_attack.none
	self.alpha = 1.0
	self.color0 = 1
	self.color1 = 3
	image_xscale = 1
	image_yscale = 1
end

#endregion