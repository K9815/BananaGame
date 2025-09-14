if (global.jogo_pausado) {
    image_speed = 0;
    exit;
} else {
    image_speed = image_speed_base;
}

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
        image_speed_base = 0.2;

        contador_ataque += 1;
        if (contador_ataque >= tempo_entre_ataques) {
            contador_ataque = 0;
            tempo_entre_ataques = irandom_range(60, 120); 
            alvo = instance_nearest(x, y, o_player);
            state = "attack";
            ataque_realizado = false; // Reset aqui também, para garantir
        }
        break;

    case "attack":
        sprite_index = spr_tomatq;
        image_speed_base = 0.4;

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

            // Causar dano ao jogador uma única vez por ataque
            if (place_meeting(x, y, alvo) && !ataque_realizado) {
                with (alvo) {
                    tomar_dano(20); 
                }

                ataque_realizado = true;

                if (global.efeitos_ativos) {
                    audio_play_sound(som_atqtom, 1, false);
                }

                show_debug_message("Ataque");
            }
        }

        // Voltar ao idle quando a animação terminar
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
            if (global.efeitos_ativos) {
                 audio_play_sound(som_danopl, 1, false);
            }
            tomar_dano_tomate(50); 
            ataque_recebido = true;
			
			// Vampirismo - tentativa de curar o jogador
		if (jogador.chance_vampirismo > 0 && random(1) < jogador.chance_vampirismo) {
        jogador.curar(10); // Curar 10 de vida (ajuste conforme quiser)
        show_debug_message("Vampirismo ativado! Curou 10 de vida.");
		}


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
