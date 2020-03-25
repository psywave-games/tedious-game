if lite() then
	exit

var _shadder = outline_os()

uni_size = shader_get_uniform(_shadder, "size");
uni_thick = shader_get_uniform(_shadder, "thick");
uni_color = shader_get_uniform(_shadder, "oColor");
uni_acc = shader_get_uniform(_shadder, "accuracy");
uni_tol = shader_get_uniform(_shadder, "tol");
uni_uvs = shader_get_uniform(_shadder, "uvs");
