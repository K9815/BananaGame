// scr_vidaau.gml
/// @function scr_vidaau()
/// @description Aplica a habilidade de Vida Aumentada ao jogador.

var _player_instance = -1; 

if (instance_exists(o_player)) {
    _player_instance = instance_find(o_player, 0); 
}

if (_player_instance != -1) { 
    with (_player_instance) {
        // Se 'vida_maxima_base' não existir, inicializa com o valor atual de vida_maxima.
        // Isso é importante para que aumentos subsequentes sejam baseados em um valor "limpo".
        if (!variable_instance_exists(id, "vida_maxima_base")) {
            vida_maxima_base = vida_maxima; 
        }
        
        vida_maxima_base *= 1.20; // Aumenta a vida máxima base em 20%
        vida_maxima = round(vida_maxima_base); // Atualiza a vida máxima real e arredonda para um inteiro
        vida_atual = vida_maxima; // Opcional: Cura o jogador completamente ao pegar a habilidade
        
        show_debug_message("Vida Máxima aumentada! Nova vida máxima: " + string(vida_maxima));
    }
} else {
    show_debug_message("AVISO: o_player não encontrado ao aplicar Vida Aumentada.");
}