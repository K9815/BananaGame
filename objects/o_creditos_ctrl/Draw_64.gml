draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font_menu_pausa); // Use a fonte que estiver usando no jogo

// Fundo preto
draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Desenha os textos com rolagem
var margem_x = 40;
var margem_y = 40;
var espacamento = 50;

for (var i = 0; i < array_length(creditos); i++) {
    var texto = creditos[i];
    var pos_y = margem_y + scroll_y + i * espacamento;
    draw_set_color(c_white);
    draw_text(margem_x, pos_y, texto);
}
