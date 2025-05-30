if (!global.jogo_pausado) {
    draw_set_halign(fa_left); 
    draw_set_valign(fa_top);
    draw_set_color(c_white); 
    draw_text(32, 32, "Wave: " + string(wave_atual));
}
