habilidades_exibidas = [];
selecionada = 0; // Começa na primeira habilidade
escala_sprite_habilidade = 0.4;
espaco_entre_cards = 20;
card_base_y = display_get_gui_height() / 2 - 170;

// Clona o array manualmente
var todas = global.todas_habilidades;
var habilidades_copia = array_create(array_length(todas));
for (var i = 0; i < array_length(todas); i++) {
    habilidades_copia[i] = todas[i];
}

// Embaralha corretamente (usando o retorno da função)
habilidades_copia = array_shuffle(habilidades_copia);

// Pega as 3 primeiras habilidades
for (var i = 0; i < 3; i++) {
    array_push(habilidades_exibidas, habilidades_copia[i]);
}
