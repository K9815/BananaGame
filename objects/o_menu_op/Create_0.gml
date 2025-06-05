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

// === BOTÃO "Música" ===
var btn_musica = instance_create_layer(centro_x, centro_y, "GUI", o_btn_msc);
btn_musica.image_xscale = escala;
btn_musica.image_yscale = escala;
btn_musica.largura = btn_musica.sprite_width * escala;
btn_musica.altura = btn_musica.sprite_height * escala;
btn_musica.x -= btn_musica.largura / 80;
btn_musica.y -= btn_musica.altura / 23;

// === BOTÃO "Efeitos Sonoros" ===
var btn_efeitos = instance_create_layer(centro_x, centro_y + espacamento_y, "GUI", o_btn_som);
btn_efeitos.image_xscale = escala;
btn_efeitos.image_yscale = escala;
btn_efeitos.largura = btn_efeitos.sprite_width * escala;
btn_efeitos.altura = btn_efeitos.sprite_height * escala;
btn_efeitos.x -= btn_efeitos.largura / 80;
btn_efeitos.y -= btn_efeitos.altura / 23;

// === BOTÃO "Sair para Menu" ===
var btn_sair = instance_create_layer(centro_x, centro_y + espacamento_y * 2, "GUI", o_btn_sairop);
btn_sair.image_xscale = escala;
btn_sair.image_yscale = escala;
btn_sair.largura = btn_sair.sprite_width * escala;
btn_sair.altura = btn_sair.sprite_height * escala;
btn_sair.x -= btn_sair.largura / 80;
btn_sair.y -= btn_sair.altura / 23;


