// o_player - Evento Step (Código fornecido com a correção de _joy_h)

// Sai se o jogo estiver pausado
if (global.jogo_pausado) {
    image_speed = 0;
    exit;
}

switch (state) {
    case "move":
        #region Move State
        var speedmov = 3; // Sua velocidade de movimento base

        // --- Pega Input ---
        
        // --- ADICIONADO: Pega o input do Joystick ---
        var _joy_h = 0; // Inicializa com 0
        if (instance_exists(o_joystick)) { // Verifica se o joystick existe
            var _jx = o_joystick.joy_x;    // Pega o deslocamento X do "thumb" do joystick
            var _jr = o_joystick.radius;   // Pega o raio do joystick
            if (_jr != 0) { // Evita divisão por zero
                _joy_h = _jx / _jr; // Calcula o input H normalizado (-1 a 1)
            }
        }
        // --- FIM DA ADIÇÃO ---

        // Teclado (para testes no PC)
        var _keyb_h = keyboard_check(vk_right) - keyboard_check(vk_left);

        // Combina os inputs (dando prioridade ao maior, ou some se preferir)
        var _h_input = 0;
        if (abs(_joy_h) > abs(_keyb_h)) { // Agora _joy_h tem um valor!
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
            image_xscale = sign(_h_input) * 2;
        } else {
            sprite_index = spr_plidle;
            image_speed = 0.2;
        }

        // --- Ataque (Mantém o aviso para mobile) ---
        // A linha abaixo usa o teclado (LShift). Isso NÃO vai funcionar
        // no celular. Criar um BOTÃO de ataque na tela
        // e verificar o toque nele, similar ao joystick.
        if (global.ataque_pressionado) {      // <<< MUDANÇA AQUI
	        image_index = 0;
	        state = "attack one";
	        image_speed = 0.6;
	    }

        if (tempo_invencivel > 0) {
            tempo_invencivel -= 1;
        }

        #endregion
        break;

    case "attack one":
        #region Attack State
        sprite_index = spr_platq; // Seu sprite de ataque
        image_speed = 0.6;

        if (image_index >= image_number - 1) { // Quando a animação de ataque terminar
            state = "move"; // Volta para o estado de movimento
        }
        #endregion
        break;
		

    case "dead":
        #region Dead State
        // Supondo que você tenha uma animação de morte
        if (image_index >= image_number - 1) { // Quando a animação de morte terminar
            room_restart(); // Reinicia a sala, por exemplo
        }
        #endregion
        break;
}

function tomar_dano(valor) { //FUNÇÃO DE RECEBER DANO, SERVIRÁ TANTO PRO PLAYER QUANTO PROS INIMIGOS , NÃO APAGAR
    if (tempo_invencivel <= 0) {
        vida_atual -= valor;
        tempo_invencivel = 60;

       if (vida_atual <= 0) {
            state = "dead";
            image_index = 0;
            sprite_index = spr_pldeath; 
            image_speed = 0.2;
        }
    }
}