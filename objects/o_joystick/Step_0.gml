// Reset
move_x = 0;

if (os_type == os_android || os_type == os_ios) {

    // Atualiza enquanto está arrastando
    if (is_dragging) {
        if (device_mouse_check_button(finger_id, mb_left)) {
            var tx = device_mouse_x_gui(finger_id);
            var dx = tx - joystick_center_x;

            dx = clamp(dx, -joystick_radius, joystick_radius);
            stick_x = joystick_center_x + dx;
            global.joystick_hinput = sign(dx);
        } else {
            is_dragging = false;
            stick_x = joystick_center_x;
            global.joystick_hinput = 0;
        }
    }

    // Início do toque
    if (!is_dragging) {
        for (var i = 0; i < 5; i++) { // suporta até 5 dedos
            if (device_mouse_check_button_pressed(i, mb_left)) {
                var tx = device_mouse_x_gui(i);
                var ty = device_mouse_y_gui(i);

                if (point_distance(tx, ty, joystick_center_x, joystick_center_y) < joystick_radius) {
                    finger_id = i;
                    is_dragging = true;
                    stick_x = tx;
                    break;
                }
            }
        }
    }

} else {
    // Fallback para desktop (teclado)
    if (keyboard_check(vk_left)) move_x = -1;
    else if (keyboard_check(vk_right)) move_x = 1;
}
