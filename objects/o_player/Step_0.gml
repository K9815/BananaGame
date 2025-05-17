switch (state) {
    case "move":
        #region Move State
        var speedmov = 3;

        // Movimento para a esquerda
        if ((keyboard_check(vk_left) || keyboard_check(ord("A"))) && !place_meeting(x - speedmov, y, o_parede)) {
            x -= speedmov;
            image_xscale = -2;
            sprite_index = spr_plwalk;
            image_speed = 0.2;
        }

        // Movimento para a direita
        else if ((keyboard_check(vk_right) || keyboard_check(ord("D"))) && !place_meeting(x + speedmov, y, o_parede)) {
            x += speedmov;
            image_xscale = 2;
            sprite_index = spr_plwalk;
            image_speed = 0.2;
        }

        // Sem movimento
        else {
            sprite_index = spr_plidle;
            image_speed = 0.2;
        }

        // Ataque
        if (keyboard_check_pressed(vk_lshift)) {
            image_index = 0;
            state = "attack one";
            image_speed = 0.6;
        }


        if (tempo_invencivel > 0) {
            tempo_invencivel -= 1;
        }

        if (place_meeting(x, y, o_cenoura) && tempo_invencivel <= 0) {
            tomar_dano(20);
            tempo_invencivel = 30;
        }
        #endregion
        break;

    case "attack one":
        #region Attack State
        sprite_index = spr_platq;

        // Após a animação de ataque, volta para o estado move
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
