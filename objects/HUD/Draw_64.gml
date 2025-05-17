// Desenha a barra de fundo
draw_set_color(c_black);
draw_rectangle(20, 20, 220, 40, false);

// Barra de vida atual
var vida = o_player.vida_atual;
var vida_max = o_player.vida_maxima;
var largura_barra = 200 * (vida / vida_max);

draw_set_color(c_red);
draw_rectangle(20, 20, 20 + largura_barra, 40, false);

// Texto
draw_set_color(c_white);
draw_text(20, 45, string(vida) + " / " + string(vida_max));
