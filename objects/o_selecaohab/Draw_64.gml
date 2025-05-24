draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Fundo escuro translúcido
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

var num_habilidades = array_length(habilidades_exibidas);
if (num_habilidades == 0) exit;

var escala = escala_sprite_habilidade;
var single_card_orig_width = sprite_get_width(habilidades_exibidas[0].sprite);
var single_card_scaled_width = single_card_orig_width * escala;


var total_width_of_cards_and_space = (single_card_scaled_width * num_habilidades) + (espaco_entre_cards * (num_habilidades - 1));
var start_x_for_first_card_left_edge = (display_get_gui_width() / 2) - (total_width_of_cards_and_space / 2); 

var card_base_y = display_get_gui_height() / 2 - 170;

var current_mouse_gui_x = device_mouse_x_to_gui(0);
var current_mouse_gui_y = device_mouse_y_to_gui(0);


for (var i = 0; i < num_habilidades; i++) {
    var habilidade_info = habilidades_exibidas[i];
    var spr = habilidade_info.sprite;
    var nome = habilidade_info.nome;
    var descricao = habilidade_info.descricao;

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

    draw_set_alpha(0.5);
    draw_set_color(c_blue);
    draw_rectangle(rect_left, rect_top, rect_right, rect_bottom, false);
    draw_set_alpha(1);

    var mouse_over = point_in_rectangle(current_mouse_gui_x, current_mouse_gui_y, rect_left, rect_top, rect_right, rect_bottom);

    if (mouse_over) {
        draw_set_color(c_yellow);
        draw_rectangle(rect_left - 4, rect_top - 4, rect_right + 4, rect_bottom + 4, false);
    }
    
    draw_sprite_ext(spr, 0, x_draw, y_draw, escala, escala, 0, c_white, 1);

    draw_set_color(c_white);
    draw_text(x_draw, rect_bottom + 10, nome);

    draw_set_font(f_ability_desc);
    draw_text_ext(x_draw, rect_bottom + 40, descricao, 18, spr_scaled_width);
    draw_set_font(-1);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);