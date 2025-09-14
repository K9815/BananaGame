draw_self()

var texto = "Música";
var texto_x = x + largura / 5;
var texto_y = y - string_height(texto) / 2;

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(texto_x, texto_y, texto);