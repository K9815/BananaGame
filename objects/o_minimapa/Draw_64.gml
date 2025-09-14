// CONFIGURAÇÕES
var borda_cor = c_white;
var fundo_cor = c_white; // Apenas cor branca, transparência será definida com draw_set_alpha()
var ponto_jogador_cor = c_lime;
var ponto_inimigo_cor = c_red;

var ret_x = map_x;
var ret_y = map_y;
var ret_w = map_width;
var ret_h =	20; // altura ligeiramente maior

// Desenhar o fundo semi-transparente
draw_set_color(fundo_cor);
draw_set_alpha(0.2); // opacidade baixa
draw_rectangle(ret_x, ret_y, ret_x + ret_w, ret_y + ret_h, false); // fundo do minimapa

// Desenhar a borda branca sólida
draw_set_alpha(1); // voltar para opacidade total
draw_set_color(borda_cor);
draw_rectangle(ret_x, ret_y, ret_x + ret_w, ret_y + ret_h, false);

// Preenchimento transparente (opcional, para reforçar o centro visual)
draw_set_alpha(0.2); // 20% opacidade
draw_rectangle(ret_x, ret_y, ret_x + ret_w, ret_y + ret_h, true);
draw_set_alpha(1); // Resetar opacidade


// Desenhar ponto do jogador
if (instance_exists(o_player)) {
    var px = o_player.x;
    var player_map_x = map_x + ((px - fase_inicio) / (fase_fim - fase_inicio)) * map_width;
    
    draw_set_color(ponto_jogador_cor);
    draw_circle(player_map_x, map_y + ret_h / 2, 3, false);
}

// Desenhar pontos dos inimigos
var inimigos = array_create(0);

with (o_cenoura) array_push(inimigos, id);
with (o_tomate) array_push(inimigos, id);

for (var i = 0; i < array_length(inimigos); i++) {
    var inimigo = inimigos[i];
    var ix = inimigo.x;
    var imap_x = map_x + ((ix - fase_inicio) / (fase_fim - fase_inicio)) * map_width;
    
    draw_set_color(ponto_inimigo_cor);
    draw_circle(imap_x, map_y + ret_h / 2, 2, false);
}
