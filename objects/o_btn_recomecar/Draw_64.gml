draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_menu_pausa);
draw_set_color(c_white);
draw_text(x, y, texto);

var fator = 0.3; // menor que antes
var largura_hitbox = largura * fator;
var altura_hitbox = altura * fator;

draw_set_alpha(0.3);
draw_set_color(c_blue);
draw_rectangle(
    x - largura_hitbox / 2, y - altura_hitbox / 2,
    x + largura_hitbox / 2, y + altura_hitbox / 2,
    false
);
draw_set_alpha(1);