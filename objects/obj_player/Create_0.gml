///	@see				verifica se o player já foi criado
/// @description		seta posição do jogador e se auto-destroi se nescessario, para não duplicar jogadores
/// @return				void
if instance_exists(game.app.player) and game.app.player begin
	game.app.player.x = self.x
	game.app.player.y = self.y

	instance_destroy(self.id)
end


game.app.player = self.id

self.state = fsm_player.idle

self.escada = 0

speak_install()
