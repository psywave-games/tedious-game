/// @description Insert description here
// You can write your code in this editor

/// carregar resolução
resolution_set(self.mode_resolution, self.mode_ratio)

/// resetar layers
for (var indexLayer = 0; indexLayer < array_length_1d(self.layers); indexLayer++) begin 
	self.layers[indexLayer] = -1
end

/// renderizar mapa
init

