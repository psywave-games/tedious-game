///////
///
///	@function Create
///	@author RodrigoDornelles <rodrigo@dornelles.me>
///
///	@version	1.1		(12/12/2019) #c6db2a4 gameplay test
///	@revison	1.1.1	(12/12/2019) #4776e3c added smooth camera
///	@revison	1.2		(12/12/2019) #7b5387a started using pattern design mediator
///
///////
///
/// @see				efeitos visuais do jogador
///	@description		shadders
///
///////
///
///	@return void		
///
///////

#region SHADDER OUTLINE
/*outline_start(
	game_config.fighterOutlineSize,
	game_config.fighterOutlineColor,
	sprite_index, 
	2, 
	0.9
)*/

#endregion


speak_process()

draw_sprite_ext(spr_idle0, image_index, x, y, image_xscale, image_yscale, 0, game.app.color[2], 1)
draw_sprite_ext(spr_idle1, image_index, x, y, image_xscale, image_yscale, 0, game.app.color[4], 1)
draw_sprite_ext(spr_idle2, image_index, x, y, image_xscale, image_yscale, 0, game.app.color[3], 1)
draw_sprite_ext(spr_idle3, image_index, x, y, image_xscale, image_yscale, 0, game.app.color[3], 1)


