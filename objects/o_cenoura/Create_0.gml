image_speed = 0.2;
state = "idle";
ataque_realizado = false;
vida_maxima = 100;
vida_atual = vida_maxima;
velocidade = 2;
alvo = noone;
tempo_entre_ataques = irandom_range(60, 120);
contador_ataque = 0;
ataque_recebido = false;
morrendo = false; 
tempo_dano = 0;
image_speed_base = 0.2;

function tomar_dano_cenoura(valor) {
    if (morrendo) return;

    vida_atual -= valor;

    sprite_index = spr_cenhurt;
    image_index = 0;
    image_speed = 0.3;
    tempo_dano = 15; 

    if (vida_atual <= 0) {
        state = "morte";
        morrendo = true;
        sprite_index = spr_cendeath;
        image_index = 0;
        image_speed = 0.3;
		
		 // ⚡ CORRENTE ELÉTRICA
    if (instance_exists(o_player) && o_player.has_corrente_eletrica) {
        var quantidade = o_player.qtd_corrente_eletrica; // Quantos inimigos atingirá
        var dano = 20; // Ou algo que escale
        var raio = 96; // Alcance do raio
         script_execute(scr_corrente_dano_ao_redor, x, y, raio, quantidade, dano);
	    }
	}
}
