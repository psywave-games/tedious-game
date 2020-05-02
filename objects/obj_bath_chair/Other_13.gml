/// @descriptio ev_interact_switch

var _sign = game.app.input.key_axis_switch
var _next = clamp(self.select + _sign, 1, 3)

self.select = _next