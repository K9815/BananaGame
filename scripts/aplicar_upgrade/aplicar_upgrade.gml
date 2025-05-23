function aplicar_upgrade(tipo) {
    switch (tipo) {
        case "velocidade_ataque":
            o_player.upgrade_ataque_veloz += 1;
            break;
        case "corrente_eletrica":
            o_player.upgrade_corrente += 1;
            break;
        case "vampirismo":
            o_player.upgrade_vampirismo += 1;
            break;
        case "resistencia":
            o_player.upgrade_resistencia += 1;
            break;
        case "vida_maxima":
            o_player.upgrade_vida_max += 1;
            o_player.vida_maxima += 20; 
            o_player.vida_atual = o_player.vida_maxima; 
            break;
    }
}