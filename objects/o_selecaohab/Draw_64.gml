draw_set_halign(fa_center);
draw_set_valign(fa_top);

for (var i = 0; i < array_length(habilidades_disponiveis); i++) {
    var hab = habilidades_disponiveis[i];
    var x_pos = base_x + i * espaco;
    var y_pos = base_y;
    var escala = 0.5;

    var spr = hab.sprite;
    var spr_width = sprite_get_width(spr) * escala;
    var spr_height = sprite_get_height(spr) * escala;

    // Verifica se o mouse está sobre a carta
    var mouse_over = point_in_rectangle(mouse_x, mouse_y, x_pos - spr_width / 2, y_pos, x_pos + spr_width / 2, y_pos + spr_height);

    // Desenha destaque se mouse estiver em cima
    if (mouse_over) {
        draw_set_color(c_yellow);
        draw_rectangle(x_pos - spr_width / 2 - 4, y_pos - 4, x_pos + spr_width / 2 + 4, y_pos + spr_height + 4, false);
    }

    // Desenha a habilidade
    draw_sprite_ext(spr, 0, x_pos, y_pos, escala, escala, 0, c_white, 1);

    // Desenha o nome
    draw_set_color(c_white);
    draw_text(x_pos, y_pos + spr_height + 10, hab.nome + " (Nv. " + string(hab.nivel + 1) + ")");
}
