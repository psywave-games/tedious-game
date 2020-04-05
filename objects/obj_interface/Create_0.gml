/// @see						para uso interno de funções
/// @example					game.app.interface.step
/// @return	integer				atualizações da interface
self.step = 0

/// @see						posicionamento da camera no mapa
/// @return	float				posição da camera
self.camx = 0
self.camy = 0

/// @see						menu game selected
/// @example					game.app.interface.select
/// @return	integer				index sobre o menu
self.select = 0

/// @see						score in interface
/// @return	integer				score delay
self.display_score = 0
self.happy_sign = 0

self.message = ""

event_user(ev_init)