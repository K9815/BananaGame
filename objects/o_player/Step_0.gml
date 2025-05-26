if (global.jogo_pausado) {
    image_speed = 0;
    exit;
}

switch (state) {
    case "move":
        #region Move State
        var speedmov = 3; // Sua velocidade de movimento base

        // --- Pega Input ---
        // Teclado (para testes no PC)
        var _keyb_h = keyboard_check(vk_right) - keyboard_check(vk_left);
        // Joystick (vem do o_joystick)
        var _joy_h = global.joystick_hinput;

        // Combina os inputs (dando prioridade ao maior, ou some se preferir)
        var _h_input = 0;
        if (abs(_joy_h) > abs(_keyb_h)) {
            _h_input = _joy_h;
        } else {
            _h_input = _keyb_h;
        }
        // Garante que o input não passe de -1 ou 1
        _h_input = clamp(_h_input, -1, 1);

        // --- Calcula o movimento ---
        var _move_x = _h_input * speedmov;
        var _move_y = 0; // SEMPRE ZERO!

        // --- Colisão ---
        if (!place_meeting(x + _move_x, y, o_parede)) {
            x += _move_x;
        }

        // --- Animação ---
        if (_h_input != 0) {
            sprite_index = spr_plwalk;
            image_speed = 0.2;
            image_xscale = sign(_h_input) * 2; // Usa sign() para definir a direção (1 ou -1) * 2
        } else {
            sprite_index = spr_plidle;
            image_speed = 0.2;
        }
        // --- !!! ATENÇÃO: PROBLEMA PARA MOBILE !!! ---
        // A linha abaixo usa o teclado (LShift). Isso NÃO vai funcionar
        // no celular. Criar um BOTÃO de ataque na tela
        // e verificar o toque nele, similar ao joystick.
        if (keyboard_check_pressed(vk_lshift)) {
            image_index = 0;
            state = "attack one";
            image_speed = 0.6;
        }
        // --- Fim do Aviso ---

        if (tempo_invencivel > 0) {
            tempo_invencivel -= 1;
        }

        #endregion
        break;

    case "attack one":
        #region Attack State
        sprite_index = spr_platq;

        if (image_index >= image_number - 1) {
            state = "move";
        }
        #endregion
        break;

    case "dead":
        #region Dead State
        if (image_index >= image_number - 1) {
            room_restart();
        }
        #endregion
        break;
}