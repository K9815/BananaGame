// Posição do botão no centro da tela
x = display_get_gui_width() - sprite_get_width(sprite_index) * image_xscale - 32;
y = 32;

// Largura e altura reais
var btn_w = sprite_get_width(sprite_index) * image_xscale;
var btn_h = sprite_get_height(sprite_index) * image_yscale;

// Clique (ajustando para origem central)
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var btn_left = x - btn_w / 2;
var btn_right = x + btn_w / 2;
var btn_top = y - btn_h / 2;
var btn_bottom = y + btn_h / 2;

if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mx, my, btn_left, btn_top, btn_right, btn_bottom)) {
		if (global.efeitos_ativos) {
	    audio_play_sound(som_btn, 1, false);
		}
        if (!global.jogo_pausado) {
            global.jogo_pausado = true;
            instance_create_layer(0, 0, "GUI", o_menu_pausa);
        }
    }
}
