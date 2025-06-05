// Detecta clique ou toque para iniciar o arrasto
if (mouse_check_button_pressed(mb_left)) {
    dragging = true;
    drag_start_y = device_mouse_y_to_gui(0);
    scroll_start_y = scroll_y;
}

// Solta o clique
if (mouse_check_button_released(mb_left)) {
    dragging = false;
}

// Durante o arrasto
if (dragging) {
    var current_y = device_mouse_y_to_gui(0);
    var delta = current_y - drag_start_y;
    scroll_y = scroll_start_y + delta;
}
