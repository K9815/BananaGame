image_speed = 0.2;

// Estado inicial
state = "move";

// Vida do jogador
vida_maxima = 100;
vida_atual = vida_maxima;

// Tempo de invencibilidade
tempo_invencivel = 0;

function tomar_dano(valor) {
    if (tempo_invencivel <= 0) {
        vida_atual -= valor;
        tempo_invencivel = 30;

       if (vida_atual <= 0) {
            state = "dead";
            image_index = 0;
            sprite_index = spr_pldeath; 
            image_speed = 0.2;
        }
    }
}

// Sistema de Habilidades
upgrade_ataque_veloz = 0;
upgrade_corrente = 0;
inimigos_derrotados_para_vamp = 0;
upgrade_vampirismo = 0;
upgrade_resistencia = 0;
upgrade_vida_max = 0;

// Vida base e vida atual
vida_maxima_base = 100;
vida_maxima = vida_maxima_base;
vida_atual = vida_maxima;
