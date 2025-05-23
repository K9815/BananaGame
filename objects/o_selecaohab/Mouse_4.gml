for (var i = 0; i < array_length(habilidades_disponiveis); i++) {
    var hab = habilidades_disponiveis[i];
    var x_pos = base_x + i * espaco;
    var y_pos = base_y;
    var escala = 0.5;

    var spr = hab.sprite;
    var spr_width = sprite_get_width(spr) * escala;
    var spr_height = sprite_get_height(spr) * escala;

    if (point_in_rectangle(mouse_x, mouse_y, x_pos - spr_width / 2, y_pos, x_pos + spr_width / 2, y_pos + spr_height)) {
        selecionada = i;
        aplicar_habilidade(habilidades_disponiveis[i]); // você irá criar essa função
        instance_destroy(o_selecaohab); // fecha a seleção
        global.jogo_pausado = false;
        break;
    }
}
