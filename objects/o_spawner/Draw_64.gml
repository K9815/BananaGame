draw_set_halign(fa_left); // Garante que o alinhamento não seja afetado por outros draw_set
draw_set_valign(fa_top);
draw_set_color(c_white); // Cor padrão para o texto da UI
draw_text(32, 32, "Wave: " + string(wave_atual));