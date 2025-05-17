// Frames de velocidade do sprite, o default é 1
image_speed = 0.2;

// Estado inicial
state = "move";

// Vida do jogador
vida_maxima = 100;
vida_atual = vida_maxima;

// Tempo de invencibilidade
tempo_invencivel = 0;

// Função de dano (se estiver usando GameMaker 2022+)
function tomar_dano(valor) {
    if (tempo_invencivel <= 0) {
        vida_atual -= valor;
        tempo_invencivel = 30; // 30 frames (~0.5 segundos)

       if (vida_atual <= 0) {
            state = "dead";
            image_index = 0;
            sprite_index = spr_pldeath; 
            image_speed = 0.2;
        }
    }
}
