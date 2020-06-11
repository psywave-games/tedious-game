/// @description ev_interact_down_end

switch self.in_object begin

	/// pequena possiblidade ao abrir uma porta fazer o som de um pato
	case obj_door0:
		if irandom(100) then 
			break
			
		audio_stop(snd_door_open)
		audio_play_at(self.in_mob.x, self.in_mob.y, snd_quack, false)
		break
		
end