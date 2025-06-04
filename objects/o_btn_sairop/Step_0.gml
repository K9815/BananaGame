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
        
		      if (texto == "Continuar") {
            instance_destroy(o_menu_pausa);
            instance_destroy(o_fundo_pausa);
            instance_destroy();
            global.jogo_pausado = false;
        } else {
                instance_destroy(o_menu_pausa);
				instance_destroy(o_btn_cont);
				instance_destroy(o_tela_morte);
				instance_destroy(o_fundo_death);
				instance_destroy(o_btn_recomecar);
	            instance_destroy(o_fundo_pausa);
	            global.jogo_pausado = false;
	            room_goto(room_reset);
        }
    }
}
