image_speed = 0.2;
state = "idle";

vida_maxima = 100;
vida_atual = vida_maxima;
velocidade = 2;
alvo = noone;
tempo_entre_ataques = irandom_range(60, 120);
contador_ataque = 0;
ataque_recebido = false;
morrendo = false; 
tempo_dano = 0;


function tomar_dano_cenoura(valor) {
    if (morrendo) return;

    vida_atual -= valor;

    sprite_index = spr_cenhurt;
    image_index = 0;
    image_speed = 0.4;
    tempo_dano = 15; 

    if (vida_atual <= 0) {
        state = "morte";
        morrendo = true;
        sprite_index = spr_cendeath;
        image_index = 0;
        image_speed = 0.3;
    }
}

