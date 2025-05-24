// scr_vamp.gml
/// @function scr_vamp()
/// @description Aplica a habilidade de Vampirismo ao jogador.

var _player_instance = -1; 

if (instance_exists(o_player)) {
    _player_instance = instance_find(o_player, 0); 
}

if (_player_instance != -1) { 
    with (_player_instance) {
        // Adiciona ou aumenta a chance de roubo de vida.
        // Assumindo que você tem uma variável 'chance_vampirismo' no o_player
        if (!variable_instance_exists(id, "chance_vampirismo")) {
            chance_vampirismo = 0; // Inicializa se não existir
        }
        chance_vampirismo += 0.05; // Aumenta em 5% a cada vez (ajuste o valor conforme balanceamento)

        // Opcional: Limitar o valor máximo de vampirismo
        chance_vampirismo = min(chance_vampirismo, 0.5); // Limita a 50%

        show_debug_message("Habilidade Vampirismo aplicada! Nova chance: " + string(chance_vampirismo * 100) + "%");
    }
} else {
    show_debug_message("AVISO: o_player não encontrado ao aplicar Vampirismo.");
}