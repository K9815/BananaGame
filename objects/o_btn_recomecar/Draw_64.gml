draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_menu_pausa);
draw_set_color(c_white);
draw_text(x, y, texto);

var fator = 0.3; // menor que antes
var largura_hitbox = largura * fator;
var altura_hitbox = altura * fator;
