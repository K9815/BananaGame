// Fator de redução da hitbox
var fator = 0.3;

var largura_hitbox = largura * fator;
var altura_hitbox = altura * fator;

if (device_mouse_check_button_pressed(0, mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    if (point_in_rectangle(mx, my,
        x - largura_hitbox / 2, y - altura_hitbox / 2,
        x + largura_hitbox / 2, y + altura_hitbox / 2)) {
        
        if (texto == "Sair") {
			if (global.efeitos_ativos) {
	    audio_play_sound(som_btn, 1, false);
		}
            game_end();
        }
    }
}
