// scr_velatq.gml
/// @function scr_velatq()
/// @description Aplica a habilidade de aumento de velocidade de ataque ao jogador.

var _player_instance = -1; 

if (instance_exists(o_player)) {
    _player_instance = instance_find(o_player, 0); 
}

if (_player_instance != -1) { 
    with (_player_instance) {
        // Aumenta a velocidade de ataque do jogador.
        // Supondo que você tenha uma variável 'cooldown_ataque' no seu o_player.
        // Esta variável deve ser o número de frames entre os ataques.

        if (!variable_instance_exists(id, "cooldown_ataque")) {
            cooldown_ataque = 30; // Valor padrão se não existir (ex: ataca a cada 30 frames)
        }

        // Diminui o cooldown do ataque (o que aumenta a velocidade).
        // Evita que o cooldown fique muito baixo (ex: mínimo de 5 frames, para não atacar insanamente rápido).
        if (cooldown_ataque > 5) { 
            cooldown_ataque *= 0.85; // Diminui em 15% (ajuste o valor conforme balanceamento)
        }
        
        show_debug_message("Velocidade de Ataque aumentada! Novo cooldown: " + string(cooldown_ataque));
    }
} else {
    show_debug_message("AVISO: o_player não encontrado ao aplicar Velocidade de Ataque.");
}