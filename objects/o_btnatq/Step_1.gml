// Reseta o touch_id se o dedo não estiver mais pressionando este botão
if (touch_id != -1 && !device_mouse_check_button(touch_id, mb_left))
{
    // Vamos verificar se o dedo SOLTOU especificamente ESTE botão
    var _released_on_this = true; // Assume que soltou
    if (device_mouse_check_button_released(touch_id, mb_left)) { // Checa se o botão foi solto
         var _tx = device_mouse_x_to_gui(touch_id);
         var _ty = device_mouse_y_to_gui(touch_id);
         if (!point_in_rectangle(_tx, _ty, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
             // Foi solto, mas fora deste botão
             // Isso é complexo de rastrear aqui. O manager é melhor para isso.
             // Por enquanto, se o botão não está mais segurado, resetamos.
         }
    } else if (device_mouse_check_button(touch_id, mb_left)) {
        // Ainda está segurando, mas talvez outro botão?
        // O manager deveria lidar com isso. Por segurança, se não está mais segurado, reseta.
        _released_on_this = false;
    }


    if (_released_on_this || !device_mouse_check_button(touch_id, mb_left)) {
         touch_id = -1;
    }
}