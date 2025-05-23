function aplicar_habilidade(hab) {
    switch (hab.nome) {
        case "Velocidade de Ataque":
            aplicar_upgrade("velocidade_ataque");
            break;

        case "Corrente Elétrica":
            aplicar_upgrade("corrente_eletrica");
            break;

        case "Vampirismo":
            aplicar_upgrade("vampirismo");
            break;

        case "Resistência Aumentada":
            aplicar_upgrade("resistencia");
            break;

        case "Vida Aumentada":
            aplicar_upgrade("vida_maxima");
            break;
    }
}
