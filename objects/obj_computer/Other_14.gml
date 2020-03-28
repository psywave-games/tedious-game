/// @description ev_interact_message 
switch self.select begin

	case 1:
		self.message = t(msg.interact_google)
		break

	case 2:
		self.message = t(msg.interact_book)
		break
end

text_switch(1,2)