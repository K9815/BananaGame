x = display_get_gui_width() / 2;
y = display_get_gui_height() / 2;

image_xscale = 2;
image_yscale = 2;

// Fundo do menu
var fundo = instance_create_layer(x, y, "GUI", o_fundo_pausa);
fundo.image_xscale = image_xscale;
fundo.image_yscale = image_yscale;

// Criar botões centralizados
var espacamento = 80;

var btn_cont = instance_create_layer(x, y - espacamento, "GUI", o_btn_cont);
btn_cont.x -= btn_cont.sprite_width / 2;
btn_cont.y -= btn_cont.sprite_height / 2;

var btn_sair = instance_create_layer(x, y + espacamento, "GUI", o_btn_sairm);
btn_sair.x -= btn_sair.sprite_width / 2;
btn_sair.y -= btn_sair.sprite_height / 2;
