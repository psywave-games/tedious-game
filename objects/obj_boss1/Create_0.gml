/// @description Insert description here
// You can write your code in this editor


///	@see					correção do angulo
self.angle_fix	= 315	

/// @see					pacote de sprites
self.sprite0 = spr_martelo0
self.sprite1 = spr_martelo1

/// @see					paleta de cores
self.color0 = 1
self.color1 = 3

///	@see					opacidade do inimigo
self.alpha = 1.0

/// @see					seguir quando estiver parado
self.seek_on_sleep = true


self.attack1_step = 0

#region FINITE STATE MACHINE MODES

/// @see					estado de comportamento da ia
self.state_ia = fsm_ia_boss.sleep///fsm_ia_boss.none

/// @see					estado do ataque
self.state_attack1 = fsm_attack.none

#endregion