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
        sprite_index = spr_tomidle;
        image_speed = 0.2;
        
        contador_ataque += 1;
        if (contador_ataque >= tempo_entre_ataques) {
            contador_ataque = 0;
            tempo_entre_ataques = irandom_range(60, 120); 
            alvo = instance_nearest(x, y, o_player);
            state = "attack";
        }
        break;

	    case "attack":
	    sprite_index = spr_tomatq;
	    image_speed = 0.4;

	    if (alvo != noone) {
	        // Virar para o lado do jogador
	        if (alvo.x < x) {
	            image_xscale = 1;
	        } else {
	            image_xscale = -1;
	        }

	        // Movimento em direção ao jogador
	        var dir = point_direction(x, y, alvo.x, alvo.y);
	        x += lengthdir_x(velocidade, dir);
	        y += lengthdir_y(velocidade, dir);

	        // Causar dano ao jogador
	        if (place_meeting(x, y, alvo)) {
	            with (alvo) {
	                tomar_dano(50); 
	            }
	        }
	    }

	    // Espera a animação terminar para voltar ao idle
		if (image_index >= image_number - 1) {
		    contador_ataque = 0;
		    state = "idle";
		    sprite_index = spr_tomidle;
		}
		break;

		case "morte":
	    if (image_index >= image_number - 1) {
	        instance_destroy();
	    }
		break;

}


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
            tomar_dano_tomate(50); 
            ataque_recebido = true;
			if (instance_exists(o_spawner)) {
			    o_spawner.inimigos_derrotados += 1;
			}
        }
    }
    else
    {
        ataque_recebido = false; 
    }
}
