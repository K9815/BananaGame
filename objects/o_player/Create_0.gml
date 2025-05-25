image_speed = 0.2;

function tomar_dano(valor) { //FUNÇÃO DE RECEBER DANO, SERVIRÁ TANTO PRO PLAYER QUANTO PROS INIMIGOS , NÃO APAGAR
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

// Vida
vida_maxima = 100;
vida_atual = vida_maxima;
vida_maxima_base = vida_maxima;

// Invencibilidade
tempo_invencivel = 0;

// Estado de controle
state = "move";

// Controle de ataque
cooldown_ataque = 30; // Tempo entre ataques em frames

// Resistência
dano_recebido_multiplicador = 1.0;

// Vampirismo
chance_vampirismo = 0.0;

// Corrente Elétrica
has_corrente_eletrica = false;