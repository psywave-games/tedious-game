/// @script draw_poly()
/// @description draw vetorial sprite
/// @arg0 poly[]
/// @arg1 origin[]
/// @arg2 x
/// @arg3 y
/// @arg4 xscale
/// @arg5 yscale
/// @arg6 angle
/// @arg7 outline

var poly = argument0
var origin = argument1
var xscale = argument4
var yscale = argument5
var angle = argument6

draw_primitive_begin(argument7? pr_linestrip: pr_trianglefan)
for (var i = 1; i < array_length_1d(poly); i += 2){
    var px = poly[i - 1]
    var py = poly[i - 0]
    var xx = argument2 + ((origin[0] - px) * -xscale * dcos(angle)) - ((origin[0] - py) * -yscale * dsin(angle))
    var yy = argument3 + ((origin[1] - px) * -xscale * dsin(angle)) + ((origin[1] - py) * -yscale * dcos(angle))
    draw_vertex(xx, yy)
}
draw_primitive_end()