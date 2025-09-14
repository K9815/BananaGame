/// @description Aplica a habilidade Corrente Elétrica ao jogador.

if (instance_exists(o_player)) {
    var _player = instance_find(o_player, 0);
    with (_player) {
        has_corrente_eletrica = true;

        // Aumenta o nível
        correnteele_nivel += 1;

        // Atualiza a quantidade de inimigos que serão atingidos
        qtd_corrente_eletrica = correnteele_nivel;

        show_debug_message("Corrente Elétrica ativada! Nível atual: " + string(correnteele_nivel));
    }
}
