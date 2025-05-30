draw_self(); // desenha o sprite do botão

draw_set_font(font_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Centraliza o texto no botão
draw_text(x + sprite_width / 2, y + sprite_height / 2, texto);
