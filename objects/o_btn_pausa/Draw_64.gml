// Evento: Draw GUI
var btn_x = display_get_gui_width() - sprite_width - 32;
var btn_y = 32;

x = btn_x;
y = btn_y;

draw_sprite(sprite_index, 0, x, y);

// Clique manual
if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    if (mx > x && mx < x + sprite_width && my > y && my < y + sprite_height) {
        if (!global.jogo_pausado) {
            global.jogo_pausado = true;
            instance_create_layer(0, 0, "GUI", o_menu_pausa);
        }
    }
}
