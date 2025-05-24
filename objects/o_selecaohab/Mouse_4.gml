var num_habilidades = array_length(habilidades_exibidas);
if (num_habilidades == 0) exit;

var escala = escala_sprite_habilidade;
var single_card_orig_width = sprite_get_width(habilidades_exibidas[0].sprite);
var single_card_scaled_width = single_card_orig_width * escala;
var total_width_of_cards_and_space = (single_card_scaled_width * num_habilidades) + (espaco_entre_cards * (num_habilidades - 1));
var start_x_for_first_card_left_edge = (display_get_gui_width() / 2) - (total_width_of_cards_and_space / 2);

var card_base_y = display_get_gui_height() / 2 - 170; // MESMO VALOR DO CREATE/DRAW GUI

var current_mouse_gui_x = device_mouse_x_to_gui(0);
var current_mouse_gui_y = device_mouse_y_to_gui(0);

for (var i = 0; i < num_habilidades; i++) {
    var habilidade_info = habilidades_exibidas[i];
    var spr = habilidade_info.sprite;
    
    var spr_orig_width = sprite_get_width(spr);
    var spr_orig_height = sprite_get_height(spr);
    var spr_scaled_width = spr_orig_width * escala;
    var spr_scaled_height = spr_orig_height * escala;

    var x_draw = start_x_for_first_card_left_edge + (i * (single_card_scaled_width + espaco_entre_cards)) + (spr_scaled_width / 2);
    var y_draw = card_base_y + (spr_scaled_height / 2);

    var rect_left = x_draw - (spr_scaled_width / 2);
    var rect_top = y_draw - (spr_scaled_height / 2);
    var rect_right = x_draw + (spr_scaled_width / 2);
    var rect_bottom = y_draw + (spr_scaled_height / 2);

    if (point_in_rectangle(current_mouse_gui_x, current_mouse_gui_y, rect_left, rect_top, rect_right, rect_bottom)) {
        show_debug_message("Habilidade '" + habilidade_info.nome + "' clicada!");
        
        script_execute(habilidade_info.script_aplicar);
        
        o_spawner.alarm[0] = 3 * 60; // 3 segundos de delay
        
        instance_destroy();
        break; 
    }
}