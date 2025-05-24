// scr_resisau.gml
/// @function scr_resisau()
/// @description Aplica a habilidade de Resistência Aumentada ao jogador.

var _player_instance = -1; 

if (instance_exists(o_player)) {
    _player_instance = instance_find(o_player, 0); 
}

if (_player_instance != -1) { 
    with (_player_instance) {
        // Supondo que o_player tenha uma variável de "defesa" ou "resistencia_a_dano"
        // Você pode ter uma variável como `dano_reducao_percentual` ou `multiplicador_dano_recebido`
        if (!variable_instance_exists(id, "dano_recebido_multiplicador")) {
            dano_recebido_multiplicador = 1.0; // Inicializa se não existir
        }
        dano_recebido_multiplicador *= 0.9; // Reduz o dano para 90% do original (10% de redução)
        
        show_debug_message("Resistência Aumentada aplicada! Novo multiplicador de dano: " + string(dano_recebido_multiplicador));
    }
} else {
    show_debug_message("AVISO: o_player não encontrado ao aplicar Resistência Aumentada.");
}