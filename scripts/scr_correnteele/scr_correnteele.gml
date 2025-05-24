// scr_correnteele.gml
/// @function scr_correnteele()
/// @description Aplica a habilidade de Corrente Elétrica ao jogador.

// **VERIFICAÇÃO DE EXISTÊNCIA ROBUSTA**
var _player_instance = -1; // Variável para armazenar o ID da instância do player

// Tenta encontrar a instância do o_player.
// instance_find(object_index, n) retorna o ID da enésima instância do objeto.
// Se houver apenas um o_player, instance_find(o_player, 0) é o ideal.
// Se você estiver chamando o script DE DENTRO DO O_PLAYER (por exemplo, para uma habilidade inicial),
// pode usar 'id' se quiser que a habilidade se aplique a 'self'.
if (instance_exists(o_player)) {
    _player_instance = instance_find(o_player, 0); // Pega a primeira instância de o_player
}

if (_player_instance != -1) { // Verifica se uma instância foi encontrada
    with (_player_instance) {
        // Agora você está dentro do escopo do o_player.
        // Adicione ou modifique as variáveis do o_player aqui.
        // Exemplo:
        has_corrente_eletrica = true; // Booleana para ativar a lógica de corrente elétrica no o_player
        
        show_debug_message("Habilidade Corrente Elétrica aplicada!");
    }
} else {
    // Isso é um aviso de debug, não um erro crítico.
    show_debug_message("AVISO: o_player não encontrado ao tentar aplicar Corrente Elétrica. (Verifique se o player está na sala ou é criado antes da seleção de habilidades)");
}