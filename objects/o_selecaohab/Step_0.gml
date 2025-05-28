// TOQUE para selecionar habilidade
if (device_mouse_check_button_pressed(0, mb_left)) {
    var num_habilidades = array_length(habilidades_exibidas);
    if (num_habilidades == 0) exit;

    var escala = escala_sprite_habilidade;
    var single_card_width = sprite_get_width(habilidades_exibidas[0].sprite) * escala;
    var total_width = (single_card_width * num_habilidades) + (espaco_entre_cards * (num_habilidades - 1));
    var start_x = (display_get_gui_width() / 2) - (total_width / 2);
    var base_y = display_get_gui_height() / 2 - 170;
    var spr_scaled_height = sprite_get_height(habilidades_exibidas[0].sprite) * escala;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    for (var i = 0; i < num_habilidades; i++) {
        var x_center = start_x + (i * (single_card_width + espaco_entre_cards)) + (single_card_width / 2);
        var y_center = base_y + (spr_scaled_height / 2);

        var x1 = x_center - (single_card_width / 2);
        var y1 = y_center - (spr_scaled_height / 2);
        var x2 = x_center + (single_card_width / 2);
        var y2 = y_center + (spr_scaled_height / 2);

        if (point_in_rectangle(mx, my, x1, y1, x2, y2)) {
            var habilidade_info = habilidades_exibidas[i];

            show_debug_message("Habilidade '" + habilidade_info.nome + "' selecionada por toque!");

            script_execute(habilidade_info.script_aplicar);

            if (instance_exists(o_spawner)) {
                o_spawner.alarm[0] = 1;
            }

            global.jogo_pausado = false;
            instance_destroy();
            break;
        }
    }
}

