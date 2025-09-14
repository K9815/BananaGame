global.recomecar_acionado = false;
persistent = false;
x = display_get_gui_width() / 2;
y = display_get_gui_height() / 2;

image_xscale = 5;
image_yscale = 5;

// Fundo específico da tela de morte
var fundo = instance_create_layer(x, y, "GUI", o_fundo_death);
fundo.image_xscale = image_xscale;
fundo.image_yscale = image_yscale;

var espacamento = 100;
var escala = 3;

// Botão Recomeçar
var btn_recomecar = instance_create_layer(x, y - espacamento, "GUI", o_btn_recomecar);
btn_recomecar.image_xscale = escala;
btn_recomecar.image_yscale = escala;
btn_recomecar.largura = btn_recomecar.sprite_width * escala;
btn_recomecar.altura = btn_recomecar.sprite_height * escala;
btn_recomecar.x -= btn_recomecar.largura / 80;
btn_recomecar.y -= btn_recomecar.altura / 23;

// Botão Sair
var btn_sair = instance_create_layer(x, y + espacamento, "GUI", o_btn_sairm);
btn_sair.image_xscale = escala;
btn_sair.image_yscale = escala;
btn_sair.largura = btn_sair.sprite_width * escala;
btn_sair.altura = btn_sair.sprite_height * escala;
btn_sair.x -= btn_sair.largura / 80;
btn_sair.y -= btn_sair.altura / 23;
