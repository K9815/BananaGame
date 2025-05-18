if (tempo_dano > 0 && !morrendo) {
    tempo_dano -= 1;

    if (tempo_dano == 0) {
        if (state != "attack") {
            state = "idle";
        }
    }
}

switch (state) {
    case "idle":
        sprite_index = spr_cenidle;
        image_speed = 0.2;
        
        contador_ataque += 1;
        if (contador_ataque >= tempo_entre_ataques) {
            contador_ataque = 0;
            tempo_entre_ataques = irandom_range(60, 150); 
            alvo = instance_nearest(x, y, o_player);
            state = "attack";
        }
        break;

	    case "attack":
	    sprite_index = spr_cenatq;
	    image_speed = 0.4;

	    if (alvo != noone) {
	        if (alvo.x < x) {
	            image_xscale = 1;
	        } else {
	            image_xscale = -1;
	        }

	        var dir = point_direction(x, y, alvo.x, alvo.y);
	        x += lengthdir_x(velocidade, dir);
	        y += lengthdir_y(velocidade, dir);

	        // Causar dano ao jogador se estiver em contato e não estiver invencível
	        if (place_meeting(x, y, alvo) && alvo.tempo_invencivel <= 0) {
	            if (!ataque_recebido) {
	                alvo.tomar_dano(20);
	                ataque_recebido = true;
	            }
	        } else {
	            ataque_recebido = false;
	        }
	    }

	    contador_ataque += 1;
	    if (contador_ataque > 40) {
	        contador_ataque = 0;
	        state = "idle";
	        sprite_index = spr_cenidle;
	    }
	    break;
		
		case "morte":
	    if (image_index >= image_number - 1) {
	        instance_destroy();
	    }
		break;

}

if (!morrendo) {
    var jogador = instance_nearest(x, y, o_player);

    if (jogador != noone)
    {
        if (place_meeting(x, y, jogador) &&
            jogador.state == "attack one" &&
            jogador.sprite_index == spr_platq &&
            jogador.image_index >= 1 && jogador.image_index <= 2)
        {
            if (!ataque_recebido)
            {
                tomar_dano_cenoura(50); 
                ataque_recebido = true;
            }
        }
        else
        {
            ataque_recebido = false; 
        }
    }
}
