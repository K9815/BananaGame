// o_btnatq > Step
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Só ativa ataque quando o toque começar (tipo "clique")
if (device_mouse_check_button_pressed(0, mb_left)) {
    if (point_in_rectangle(mx, my, x, y, x + sprite_width, y + sprite_height)) {
        global.ataque_pressionado = true;
    }
}
