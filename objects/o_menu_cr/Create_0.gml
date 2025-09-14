// Centraliza o menu na tela
var centro_x = display_get_gui_width() / 2;
var centro_y = display_get_gui_height() / 2 - 200;
var espacamento_y = 220; // Espaçamento entre os botões verticalmente
var escala = 5;

// Limpa botões antigos
with (o_btnini) instance_destroy();
with (o_btnop) instance_destroy();
with (o_btn_sair) instance_destroy();
with (o_btn_creditos) instance_destroy();

// === BOTÃO "Sair para Menu" ===
var btn_sair = instance_create_layer(centro_x, centro_y + espacamento_y * 2, "GUI", o_btn_saircr);
btn_sair.image_xscale = escala;
btn_sair.image_yscale = escala;
btn_sair.largura = btn_sair.sprite_width * escala;
btn_sair.altura = btn_sair.sprite_height * escala;
btn_sair.x -= btn_sair.largura / 80;
btn_sair.y -= btn_sair.altura / 23;

// === CONTROLADOR DOS CRÉDITOS ===
var creditos = instance_create_layer(0, 0, "GUI", o_creditos_ctrl);
