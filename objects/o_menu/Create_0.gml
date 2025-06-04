// Centraliza o menu na tela
var centro_x = display_get_gui_width() / 2;
var centro_y = display_get_gui_height() / 2 + 100; // levemente mais baixo, ajuste como quiser

// Define espaçamento horizontal entre os botões
var espacamento = 220;
var escala = 3;

// Limpa botões antigos ao retornar para o menu
with (o_btnini) instance_destroy();
with (o_btnop) instance_destroy();
with (o_btn_sair) instance_destroy();
with (o_btn_creditos) instance_destroy();


// === BOTÃO "Iniciar" ===
var btn_ini = instance_create_layer(centro_x - espacamento, centro_y, "GUI", o_btnini);
btn_ini.image_xscale = escala;
btn_ini.image_yscale = escala;
btn_ini.largura = btn_ini.sprite_width * escala;
btn_ini.altura = btn_ini.sprite_height * escala;
btn_ini.x -= btn_ini.largura / 80;
btn_ini.y -= btn_ini.altura / 23;

// === BOTÃO "Opções" ===
var btn_op = instance_create_layer(centro_x, centro_y, "GUI", o_btnop);
btn_op.image_xscale = escala;
btn_op.image_yscale = escala;
btn_op.largura = btn_op.sprite_width * escala;
btn_op.altura = btn_op.sprite_height * escala;
btn_op.x -= btn_op.largura / 80;
btn_op.y -= btn_op.altura / 23;

// === BOTÃO "Sair" ===
var btn_sair = instance_create_layer(centro_x + espacamento, centro_y, "GUI", o_btn_sair);
btn_sair.image_xscale = escala;
btn_sair.image_yscale = escala;
btn_sair.largura = btn_sair.sprite_width * escala;
btn_sair.altura = btn_sair.sprite_height * escala;
btn_sair.x -= btn_sair.largura / 80;
btn_sair.y -= btn_sair.altura / 23;

// === BOTÃO "Créditos" (menor, abaixo e à direita) ===
var escala_creditos = 2; // menor que os demais
var offset_y_creditos = 130; // distância vertical abaixo dos botões principais

var btn_creditos = instance_create_layer(centro_x + espacamento, centro_y + offset_y_creditos, "GUI", o_btn_creditos);
btn_creditos.image_xscale = escala_creditos;
btn_creditos.image_yscale = escala_creditos;
btn_creditos.largura = btn_creditos.sprite_width * escala_creditos;
btn_creditos.altura = btn_creditos.sprite_height * escala_creditos;
btn_creditos.x -= btn_creditos.largura / 80;
btn_creditos.y -= btn_creditos.altura / 23;


