/// @description init

switch self.mode begin 
	
	#region CGA 8 COLORS
	case pallete.cga_8:
		game.app.color = [
			make_color_rgb(000,000,000), // 0
			make_color_rgb(000,002,156), // 1
			make_color_rgb(090,158,036), // 2
			make_color_rgb(090,158,159), // 3
			make_color_rgb(136,000,001), // 4
			make_color_rgb(136,000,156), // 5
			make_color_rgb(140,076,012), // 6
			make_color_rgb(158,157,158), // 7
			make_color_rgb(076,076,076), // 8
			make_color_rgb(077,075,251), // 9
			make_color_rgb(155,255,094), // 10
			make_color_rgb(155,254,255), // 11
			make_color_rgb(223,074,077), // 12
			make_color_rgb(223,076,251), // 13
			make_color_rgb(255,255,095), // 14
			make_color_rgb(255,255,255), // 15
		]
		break
	#endregion
	
	#region CGA 4 COLORS A
	case pallete.cga_4a:
		game.app.color = [
			make_color_rgb(000,000,000), // 0
			make_color_rgb(155,254,255), // 1
			make_color_rgb(223,076,255), // 2
			make_color_rgb(255,255,255), // 3
			make_color_rgb(080,142,251), // 4
			make_color_rgb(033,059,250), // 5
			make_color_rgb(235,167,157), // 7
			make_color_rgb(073,131,252), // 7
			make_color_rgb(140,068,008), // 8
			make_color_rgb(179,249,206), // 9
			make_color_rgb(168,149,162), // 10
			make_color_rgb(171,034,002), // 11
			make_color_rgb(221,082,015), // 12
			make_color_rgb(240,254,200), // 13
			make_color_rgb(255,255,255), // 14
			make_color_rgb(169,196,254), // 15
		]
		break
	#endregion
		
	#region CGA 4 COLORS B
	case pallete.cga_4b:
		game.app.color = [
			make_color_rgb(000,000,000), // 0
			make_color_rgb(150,246,090), // 1
			make_color_rgb(222,071,072), // 2
			make_color_rgb(252,254,091), // 3
			make_color_rgb(058,102,200), // 4
			make_color_rgb(014,031,159), // 5
			make_color_rgb(014,039,159), // 6
			make_color_rgb(213,071,013), // 7
			make_color_rgb(142,011,040), // 8
			make_color_rgb(143,205,097), // 9
			make_color_rgb(151,034,001), // 10
			make_color_rgb(138,154,147), // 11
			make_color_rgb(143,154,175), // 12
			make_color_rgb(212,093,019), // 13
			make_color_rgb(207,233,066), // 14
			make_color_rgb(230,137,033), // 15
		]
		break
	#endregion
		
	#region GameBoy Classic
	case pallete.gb:
		game.app.color = [
			make_color_rgb(027,048,004), // 0
			make_color_rgb(036,059,020), // 1
			make_color_rgb(134,156,108), // 10
			make_color_rgb(053,079,041), // 3
			make_color_rgb(059,086,048), // 4
			make_color_rgb(183,213,141), // 13
			make_color_rgb(075,103,062), // 6
			make_color_rgb(089,120,074), // 7
			make_color_rgb(103,131,077), // 8
			make_color_rgb(120,144,092), // 9
			make_color_rgb(048,071,072), // 2
			make_color_rgb(149,170,119), // 11
			make_color_rgb(167,192,129), // 12
			make_color_rgb(068,095,055), // 5
			make_color_rgb(215,238,175), // 14
			make_color_rgb(255,255,255), // 15
		]
		break
	#endregion
	
	#region GameBoy Color A
	case pallete.gbca:
		game.app.color = [
			make_color_rgb(082,082,082), // 8
			make_color_rgb(254,148,148), // 1
			make_color_rgb(255,250,004), // 2
			make_color_rgb(101,164,165), // 3
			make_color_rgb(080,255,000), // 4
			make_color_rgb(243,138,134), // 5
			make_color_rgb(123,255,048), // 6
			make_color_rgb(000,132,134), // 7
			make_color_rgb(165,165,165), // 0
			make_color_rgb(146,148,255), // 9
			make_color_rgb(250,003,000), // 10
			make_color_rgb(004,000,254), // 11
			make_color_rgb(255,065,000), // 12
			make_color_rgb(148,058,058), // 13
			make_color_rgb(000,131,001), // 14
			make_color_rgb(255,222,000), // 15
		]
		break
	#endregion
		
	#region GameBoy Color B
	case pallete.gbcb:
		game.app.color = [			
			make_color_rgb(082,082,082), // 8
			make_color_rgb(254,148,148), // 1
			make_color_rgb(255,250,004), // 2
			make_color_rgb(123,255,048), // 3
			make_color_rgb(080,255,000), // 4
			make_color_rgb(243,138,134), // 5
			make_color_rgb(101,164,155), // 6
			make_color_rgb(000,132,134), // 7
			make_color_rgb(165,165,165), // 0
			make_color_rgb(146,148,255), // 9
			make_color_rgb(250,003,000), // 10
			make_color_rgb(000,131,001), // 11
			make_color_rgb(255,065,000), // 12
			make_color_rgb(148,058,058), // 13
			make_color_rgb(000,001,251), // 14
			make_color_rgb(255,222,000), // 15
		]
		break
	#endregion
	
	#region GameBoy Color C
	case pallete.gbcc:
		game.app.color = [
			make_color_rgb(080,080,080), // 8
			make_color_rgb(219,149,133), // 1
			make_color_rgb(255,255,059), // 2
			make_color_rgb(255,255,061), // 3
			make_color_rgb(156,254,060), // 4
			make_color_rgb(156,254,060), // 5
			make_color_rgb(229,061,060), // 6
			make_color_rgb(076,133,133), // 7
			make_color_rgb(163,163,163), // 0
			make_color_rgb(146,146,251), // 9
			make_color_rgb(216,011,000), // 10
			make_color_rgb(114,073,011), // 11
			make_color_rgb(221,067,008), // 12
			make_color_rgb(058,101,192), // 13
			make_color_rgb(126,063,060), // 14
			make_color_rgb(200,200,054), // 15
		]
		break
	#endregion
		
	#region GameBoy Color D
	case pallete.gbcd:
		game.app.color = [
			make_color_rgb(000,000,000), // 8
			make_color_rgb(255,255,116), // 1
			make_color_rgb(255,255,059), // 2
			make_color_rgb(255,255,061), // 3
			make_color_rgb(156,254,060), // 4
			make_color_rgb(156,254,060), // 5
			make_color_rgb(229,061,060), // 6
			make_color_rgb(076,133,133), // 7
			make_color_rgb(080,080,080), // 0
			make_color_rgb(218,000,246), // 9
			make_color_rgb(213,000,000), // 10
			make_color_rgb(056,044,008), // 11
			make_color_rgb(213,000,000), // 12
			make_color_rgb(000,004,240), // 13
			make_color_rgb(197,004,004), // 14
			make_color_rgb(255,255,061), // 15
		]
		break	
	#endregion
	
	#region EGA 8 Colors
	case pallete.ega_8:
		game.app.color = [
			make_color_rgb(000,000,000), // 0
			make_color_rgb(003,000,166), // 1
			make_color_rgb(095,162,040), // 2
			make_color_rgb(095,168,168), // 3
			make_color_rgb(145,000,001), // 4
			make_color_rgb(145,003,165), // 5
			make_color_rgb(150,086,016), // 6
			make_color_rgb(169,169,169), // 7
			make_color_rgb(080,080,080), // 8
			make_color_rgb(087,085,251), // 9
			make_color_rgb(158,255,101), // 10
			make_color_rgb(158,255,255), // 11
			make_color_rgb(223,085,085), // 12
			make_color_rgb(222,086,250), // 13
			make_color_rgb(255,255,100), // 14
			make_color_rgb(255,255,255), // 15
		]
		break	
	#endregion
	
	#region Binary A
	case pallete.binary:
		game.app.color = [
			make_color_rgb(014,015,059), // 0
			make_color_rgb(007,064,123), // 1
			make_color_rgb(127,205,238), // 2
			make_color_rgb(247,147,030), // 3
			make_color_rgb(254,129,000), // 5
			make_color_rgb(255,255,255), // 4
			make_color_rgb(255,166,000), // 6
			make_color_rgb(098,194,204), // 7
			make_color_rgb(076,106,255),// 8
			make_color_rgb(82,146,254), // 9
			make_color_rgb(146,191,255), // 10
			make_color_rgb(253,184,019), // 11
			make_color_rgb(246,139,031), // 12
			make_color_rgb(241,112,034), // 13
			make_color_rgb(238,246,108), // 14
			make_color_rgb(228,246,248), // 15
		]
		break	
	#endregion
end 

#region GENERATE MAP
var rh_max = round(room_height)
var rw_max = round(room_width)
var indexLayer = 0

while indexLayer < array_length_1d(self.layers) begin 	
	/// pegar layer asset id
	var layerId = self.layers[indexLayer]
	
	/// verifica se a layer asset existe para deletar (e sobrescreve-la)
	if layerId != -1 begin
		layer_destroy(layerId) /// despejar layer antiga
		self.layers[indexLayer] = -1 /// layer inexistente
	end
		
	/// color blend desativado
	if not self.colorize begin
		indexLayer += 1
		continue
	end
	
	/// pegar tile name
	var tileText = "Tiles_" + string(indexLayer)
	
	/// pegar Id do mapa
	var tileId = layer_get_id(tileText)
	/// se não existir na room ignorar
	if tileId == -1 then 
		break
	
	/// tile id do mapa
	var tileId = layer_tilemap_get_id(tileId)	
	
	/// criar nova leia 
	layerId = layer_create(-indexLayer)
	self.layers[indexLayer] = layerId /// salvar na memoria layer nova
	
	/// Posições do mapa
	for (var xx = 0; xx < rw_max; xx += 16) begin
		for (var yy = 0; yy < rh_max; yy += 16) begin
			
			/// existe tile na posição
			var tile = tilemap_get_at_pixel(tileId, xx, yy)
			
			/// se não ignorar
			if not tile then 
				continue
			
			/// primeiro tile no topo
			if tile < 16 begin
				sprite = self.sprites[0] /// tile é o primeiro reservado
				color = tile /// cor equivale ao numero do tile
				
				var spriteId = layer_sprite_create(layerId, xx, yy, sprite)
				layer_sprite_blend(spriteId, game.app.color[color])
				
				continue
			end
			
			/// saber qual cor deve ser renderizado o sprite
			for (var color = 0; color < 16; color++) begin
				/// começa pela proxima linha da cor selecionada
				if tile >= (color * 16) then 
					continue
	
				/// selecionar o sprite correto
				var spriteIndex  =   tile - (color * 16) + 17
			
				/// selecionar sprite
				var sprite = self.sprites[spriteIndex]	
					
				/// criar sprite na posição desejada
				var spriteId = layer_sprite_create(layerId, xx, yy, sprite)
				
				/// ajustar cor correta
				color -= 1
					
				/// colorir conforme paleta
				layer_sprite_blend(spriteId, game.app.color[color])
				break
			end
		end
	end
	/// proximo layer
	indexLayer += 1
end
#endregion

#region GENERATE BACKGROUND
/// BACKGROUNDS COLOR 8
var index = 0
while true begin
	var back_str = "Backgrounds_" + string(index)
	var lay_id = layer_get_id(back_str)
	
	if lay_id == -1 then
		break
	
	var back_id = layer_background_get_id(lay_id)

	layer_background_blend(back_id,game.app.color[8])
	index += 1
end
//// BACKGROUND COLOR 0
var lay_id = layer_get_id("Background")
var back_id = layer_background_get_id(lay_id)
layer_background_blend(back_id,game.app.color[0])
#endregion
