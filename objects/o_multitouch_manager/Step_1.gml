// Reseta a flag global de ataque
global.ataque_pressionado = false;

var _max_devices = 4;
for (var i = 0; i < _max_devices; i++)
{
    var _touch_x = device_mouse_x_to_gui(i);
    var _touch_y = device_mouse_y_to_gui(i);

    var _pressed_now = device_mouse_check_button_pressed(i, mb_left);
    var _held_now = device_mouse_check_button(i, mb_left);

    // --- VERIFICA O BOTÃO DE ATAQUE (o_btnatq) ---
    if (instance_exists(o_btnatq)) // Garante que o botão existe
    {
        // Verifica se o toque (pressionado ou segurado) está dentro da caixa do o_btnatq
        if (point_in_rectangle(_touch_x, _touch_y, o_btnatq.bbox_left, o_btnatq.bbox_top, o_btnatq.bbox_right, o_btnatq.bbox_bottom))
        {
            // Se foi PRESSIONADO AGORA neste botão
            if (_pressed_now) 
            {
                global.ataque_pressionado = true;
                show_debug_message("o_btnatq PRESSIONADO! Touch ID: " + string(i));
				
            }

            // Se está SENDO SEGURADO neste botão (chama a função 'input' dele)
            if (_held_now)
            {
                o_btnatq.input(i, _touch_x, _touch_y); 
            }
        }
    }

    // --- LÓGICA ORIGINAL PARA O JOYSTICK (ou outros o_ui_parent) ---
    // Certifique-se que o joystick não é o mesmo que o o_btnatq para não processar duas vezes
    if (_held_now) 
    {
        var _ui_at_pos = instance_position(_touch_x, _touch_y, o_ui_parent);
        if (_ui_at_pos != noone && _ui_at_pos != o_btnatq) // Evita chamar 'input' de novo se já foi o o_btnatq
        {
            _ui_at_pos.input(i, _touch_x, _touch_y);
        } 
        // Se o joystick for o único filho de o_ui_parent ou você quiser ser mais específico:
        /*
        if (instance_exists(o_joystick)) {
            if (point_in_rectangle(_touch_x, _touch_y, o_joystick.bbox_left, o_joystick.bbox_top, o_joystick.bbox_right, o_joystick.bbox_bottom)) {
                if (_held_now) {
                    o_joystick.input(i, _touch_x, _touch_y);
                }
            }
        }
        */
    }
}