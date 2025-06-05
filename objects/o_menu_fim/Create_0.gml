// Centraliza o menu na tela
var centro_x = display_get_gui_width() / 2;
var centro_y = display_get_gui_height() / 2 - 200;
var espacamento_y = 200; // Espaçamento entre os botões verticalmente
var escala = 3;

// === BOTÃO "Sair para Menu" ===
var btn_sair = instance_create_layer(centro_x, centro_y + espacamento_y * 2, "GUI", o_btn_sairm);
btn_sair.image_xscale = escala;
btn_sair.image_yscale = escala;
btn_sair.largura = btn_sair.sprite_width * escala;
btn_sair.altura = btn_sair.sprite_height * escala;
btn_sair.x -= btn_sair.largura / 80;
btn_sair.y -= btn_sair.altura / 23;

