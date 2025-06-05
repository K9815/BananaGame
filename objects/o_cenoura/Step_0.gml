// Step - o_cenoura

if (global.jogo_pausado) {
    image_speed = 0; // Pausa a animação da sprite, mas mantém o frame atual
    exit; // Impede movimento, ataque, etc.
} else {
    image_speed = image_speed_base;
}

// Se terminou de tomar dano e estava no sprite de dano, volta ao idle
if (tempo_dano == 0 && sprite_index == spr_cenhurt) {
    if (state != "attack") {
        state = "idle";
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
            // Virar para o jogador
            image_xscale = (alvo.x < x) ? 1 : -1;

            var dir = point_direction(x, y, alvo.x, alvo.y);
            x += lengthdir_x(velocidade, dir);
            y += lengthdir_y(velocidade, dir);

            // Dano ao jogador
            if (place_meeting(x, y, alvo) && alvo.tempo_invencivel <= 0) {
                if (!ataque_realizado) {
                    if (!is_undefined(alvo.tomar_dano)) {
                        alvo.tomar_dano(10); // Aplica dano ao jogador
                    }
                    ataque_realizado = true;
                }
            } else {
                ataque_realizado = false;
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
        if (global.efeitos_ativos) {
            audio_play_sound(som_danopl, 1, false);
        }
        if (image_index >= image_number - 1) {
            instance_destroy();
        }
        break;
}

// Verificação se foi atingido por ataque do jogador
if (!morrendo) {
    var jogador = instance_nearest(x, y, o_player);

    if (jogador != noone) {
        if (place_meeting(x, y, jogador) &&
            jogador.state == "attack one" &&
            jogador.sprite_index == spr_platq &&
            jogador.image_index >= 1 && jogador.image_index <= 2)
        {
            if (global.efeitos_ativos) {
                audio_play_sound(som_danopl, 1, false);
            }

            if (!ataque_recebido) {
                tomar_dano_cenoura(50); 
                ataque_recebido = true;
            }
        } else {
            ataque_recebido = false; 
        }
    }
}
