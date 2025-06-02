// Centraliza o menu na tela com base nas dimensões da interface GUI
x = display_get_gui_width() / 2;
y = display_get_gui_height() / 2;

// Define a escala do fundo do menu
image_xscale = 5;
image_yscale = 5;

// Cria o fundo do menu na camada GUI
var fundo = instance_create_layer(x, y, "GUI", o_fundo_pausa);
fundo.image_xscale = image_xscale;
fundo.image_yscale = image_yscale;

// Define a distância entre os botões e a escala dos botões
var espacamento = 100;
var escala = 3;

// === BOTÃO "Continuar" ===

// Cria o botão "Continuar" acima do centro
var btn_cont = instance_create_layer(x, y - espacamento, "GUI", o_btn_cont);
btn_cont.image_xscale = escala;
btn_cont.image_yscale = escala;

// Calcula a largura e altura real do botão com base na escala
btn_cont.largura = btn_cont.sprite_width * escala;
btn_cont.altura = btn_cont.sprite_height * escala;

// Centraliza horizontalmente o botão, mas ajusta manualmente com "/23" para corrigir alinhamento
btn_cont.x -= btn_cont.largura / 80;
btn_cont.y -= btn_cont.altura / 23; // Centraliza verticalmente baseado na altura escalada

// === BOTÃO "Sair para o Menu" ===

// Cria o botão "Sair" abaixo do centro
var btn_sair = instance_create_layer(x, y + espacamento, "GUI", o_btn_sairm);
btn_sair.image_xscale = escala;
btn_sair.image_yscale = escala;
btn_sair.largura = btn_sair.sprite_width * escala;
btn_sair.altura = btn_sair.sprite_height * escala;

// Aplica o mesmo ajuste de alinhamento do botão anterior
btn_sair.x -= btn_sair.largura / 80;
btn_sair.y -= btn_sair.altura / 23;
